@echo off

set deploymentUuid=%1
set envBaseUrl=%2
set apiKey=%3%
set projectHome=%4
set username=%5%
set pass=%6%

set url="%envBaseUrl%/rest/a/deployment/latest/%deploymentUuid%/icf"


CD %projectHome%/cicd/APPIAN_CICD/temp

del APPIAN_PROPERTIES_FILE.properties
 
curl --location --request GET -u %username%:%pass% %url% --output APPIAN_PROPERTIES_FILE.properties

echo. >>APPIAN_PROPERTIES_FILE.properties
echo ## END OF FILE ## >>APPIAN_PROPERTIES_FILE.properties