$appCode = $args[0]
$jiraNumber = $args[1]
$targetEnv = $args[2]

$projectHome ="C:\GIT_REPO\coforge-cicd-package\APPIAN_CICD\"+$appCode

$testPath = $projectHome+"\test"

Set-Location -Path $testPath
mvn clean install

