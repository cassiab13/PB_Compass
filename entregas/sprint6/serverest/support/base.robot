*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    FakerLibrary
Resource   ./variables/serverest_variables.robot
Resource   ./fixtures/dynamic/dynamic.robot
Resource   ./fixtures/static/static.robot



*** Keywords ***
Create Session on Serverest
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json
    Create Session    alias=Serverest   url=${BASE_URI}    headers=${headers}