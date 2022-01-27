

$projectHome ="C:\GIT_REPO\coforge-cicd-package\APPIAN_CICD"

$appCode = $args[0]
$jiraNumber = $args[1]
$targetEnv = $args[2]
 


$applicationConfig = Get-Content -Raw -Path applicationConfig.json | ConvertFrom-Json
$applicationData = $applicationConfig.applications | Where-Object -Property appCode -EQ $appCode

$taregetEnvCode = if($targetEnv -eq "DEV"){$applicationData.devEnv} elseif($targetEnv -eq "SIT"){$applicationData.sitEnv} elseif($targetEnv -eq "PROD"){$applicationData.prodEnv} else {"INVALID"}
$targetEnvDetails = $applicationConfig.environments | Where-Object -Property envCode -EQ $taregetEnvCode

# Inspect package 

$inspectResponseRaw=.\inspect.bat $projectHome $targetEnvDetails.baseUrl  $targetEnvDetails.apiKey
$inspectResponse=$inspectResponseRaw | ConvertFrom-Json



$tryCount = 0
$continueLoop = 1
$result=""



# keep on checking inspection result status
while($continueLoop){

    Start-Sleep -s 3

    $tryCount= $tryCount+1
   


    echo $tryCount

    $inspectStatusResponseRaw = ./getInspectionStatus.bat $inspectResponse.uuid $targetEnvDetails.baseUrl  $targetEnvDetails.apiKey
    $inspectStatusResponse=$inspectStatusResponseRaw | ConvertFrom-Json
   

    $continueLoop = if (($tryCount -gt 120) -or ($inspectStatusResponse.status -eq "COMPLETED") -or($inspectStatusResponse.status -eq "FAILED")) { 0 } else { 1 }
  


}



# Deploy package if inspection result is successfull 
if($inspectStatusResponse.status -eq "COMPLETED")
{ 

        $deployResponseRaw=.\deploy.bat $projectHome $targetEnvDetails.baseUrl  $targetEnvDetails.apiKey
        $deployResponse=$deployResponseRaw | ConvertFrom-Json

        echo "*********$deployResponseRaw**********"
        echo  $deployResponse

        $tryCount = 0
        $continueLoop = 1
        $result=""


        # keep on checking deployment result status
        while($continueLoop){

            Start-Sleep -s 3

            $tryCount= $tryCount+1
   


            echo $tryCount

            $deployStatusResponseRaw = ./getDeploymentStatus.bat $deployResponse.uuid $targetEnvDetails.baseUrl  $targetEnvDetails.apiKey
            $deployStatusResponse=$deployStatusResponseRaw | ConvertFrom-Json


            $continueLoop = if (($tryCount -gt 120) -or ($deployStatusResponse.status -eq "COMPLETED")) { 0 } else { 1 }


        }

}

