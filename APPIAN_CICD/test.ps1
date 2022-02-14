$appCode = $args[0]
$jiraNumber = $args[1]
$targetEnv = $args[2]

$projectHome ="C:\ProgramData\Jenkins\.jenkins\workspace\EOS\test"

Set-Location -Path $projectHome
call mvn clean install

