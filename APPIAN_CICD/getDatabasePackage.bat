@echo off

set deploymentUuid=%1
set envBaseUrl=%2
set apiKey=%3%
set projectHome=%4

set url="%envBaseUrl%/webapi/getDatabasePackageByUuid/%deploymentUuid%"
set header="Appian-API-Key: %apiKey%"

CD %projectHome%/cicd/APPIAN_CICD/temp

del MASTER_DATABASE_SCRIPT.sql
 
curl --location --request GET %url% --header %header% --output MASTER_DATABASE_SCRIPT.sql


