*** Settings ***
Library    RequestsLibrary

*** Keywords ***

Criar Sessão no Restful Broker
    ${headers}  Create Dictionary  Accept=application/json    Content-Type=application/json
    Create Session    alias=RestfulBroker    url=https://restful-booker.herokuapp.com    headers=${headers}