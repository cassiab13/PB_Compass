*** Settings ***
Library    RequestsLibrary

*** Keywords ***

Criar Sessão no Restful Booker
    ${headers}  Create Dictionary  Accept=application/json    Content-Type=application/json
    Create Session    alias=RestfulBooker    url=https://restful-booker.herokuapp.com    headers=${headers}