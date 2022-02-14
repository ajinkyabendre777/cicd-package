@echo off

set projectHome=%1
set envBaseUrl=%2
set apiKey=%3

set url="%envBaseUrl%/deployment-management/v1/deployments/"
set header="Appian-API-Key: %apiKey%"

CD %projectHome%/cicd/APPIAN_CICD/temp

curl --location --request POST %url% --header %header%  --form "json={\"name\":\"EOS 1.0\",\"packageFileName\":\"APPIAN_PACKAGE.zip\",\"customizationFileName\":\"APPIAN_PROPERTIES_FILE.properties\"}" --form "zipFile=@\"APPIAN_PACKAGE.zip\"" --form "ICF=@\"APPIAN_PROPERTIES_FILE.properties\""
