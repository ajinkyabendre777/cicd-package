@echo off

set projectHome=%1
set envBaseUrl=%2
set apiKey=%3%

set url="%envBaseUrl%/deployment-management/v1/inspections/"
set header="Appian-API-Key: %apiKey%"

CD %projectHome%/cicd/APPIAN_CICD/temp

curl.exe --location --request POST %url% --header %header%  --form "json={\"packageFileName\":\"APPIAN_PACKAGE.zip\",\"customizationFileName\":\"APPIAN_PROPERTIES_FILE.properties\"}" --form "zipFile=@\"APPIAN_PACKAGE.zip\"" --form "ICF=@\"APPIAN_PROPERTIES_FILE.properties\""



