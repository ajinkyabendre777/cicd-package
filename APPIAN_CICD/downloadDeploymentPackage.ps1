
$appCode = $args[0]
$deploymentUuid = $args[1]

 
$projectHome ="C:\GIT_REPO\DEVOPS\"+$appCode
$cicdPath = $projectHome+"\cicd\APPIAN_CICD"

 

Set-Location -Path $cicdPath

$applicationConfig = Get-Content -Raw -Path applicationConfig.json | ConvertFrom-Json
$applicationData = $applicationConfig.applications | Where-Object -Property appCode -EQ $appCode

$targetEnvDetails = $applicationConfig.environments | Where-Object -Property envCode -EQ $applicationData.sitEnv

echo $targetEnvDetails.baseUrl


$downloadResponseRaw=.\getDeploymentPackage.bat $deploymentUuid $targetEnvDetails.baseUrl $targetEnvDetails.apiKey $projectHome

echo $downloadResponseRaw




 


