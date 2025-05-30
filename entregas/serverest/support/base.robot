*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   ./variables/serverest_variables.robot

*** Keywords ***
Create Session on Serverest
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    Create Session    alias=Serverest   url=${BASE_URI}    headers=${headers}