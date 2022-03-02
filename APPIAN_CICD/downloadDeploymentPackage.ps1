
$appCode = $args[0]
$deploymentUuid = $args[1]

 
$projectHome ="C:\ProgramData\Jenkins\.jenkins\workspace\"+$appCode
$cicdPath = $projectHome+"\cicd\APPIAN_CICD"

 

Set-Location -Path $cicdPath

$applicationConfig = Get-Content -Raw -Path applicationConfig.json | ConvertFrom-Json
$applicationData = $applicationConfig.applications | Where-Object -Property appCode -EQ $appCode

$targetEnvDetails = $applicationConfig.environments | Where-Object -Property envCode -EQ $applicationData.sitEnv

echo $targetEnvDetails.baseUrl

# Download appian package
$downloadResponseRaw=.\getDeploymentPackage.bat $deploymentUuid $targetEnvDetails.baseUrl $targetEnvDetails.apiKey $projectHome
echo $downloadResponseRaw

# Download Database package
$downloadDBResponseRaw=.\getDatabasePackage.bat $deploymentUuid $targetEnvDetails.baseUrl $targetEnvDetails.apiKey $projectHome
echo $downloadDBResponseRaw

 # Download Import customization file package
$downloadICFResponseRaw=.\getImportCustomizationFile.bat $deploymentUuid $targetEnvDetails.baseUrl $targetEnvDetails.apiKey $projectHome $targetEnvDetails.username $targetEnvDetails.pass

echo $downloadICFResponseRaw
