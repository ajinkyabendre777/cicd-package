@echo off

set deploymentUuid=%1
set envBaseUrl=%2
set apiKey=%3%
set projectHome=%4

set url="%envBaseUrl%/webapi/getDeploymentPackageByUuid/%deploymentUuid%"
set header="Appian-API-Key: %apiKey%"

CD %projectHome%/cicd/APPIAN_CICD/temp


curl --location --request GET %url% --header %header% --output APPIAN_PACKAGE.zip
