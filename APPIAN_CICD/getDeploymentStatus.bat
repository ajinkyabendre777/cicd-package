@echo off

set p_uuid=%1
set envBaseUrl=%2
set apiKey=%3%

set url="%envBaseUrl%/deployment-management/v1/deployments/%p_uuid%"
set header="Appian-API-Key: %apiKey%"


curl --location --request GET %url% --header %header%