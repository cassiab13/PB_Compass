*** Settings ***
Documentation    Arquivo base para criar a sessão no Restful Booker
Library          RequestsLibrary
Library          Collections
Resource         ./variables/restful_booker_variables.robot
Resource         ./common/common.robot
Resource         ./fixtures/static/statics.robot
Resource         ./fixtures/dynamics.robot
Resource         ../keywords/auth_keywords.robot
Resource         ../keywords/booking_keywords.robot
Resource         ../keywords/ping_keywords.robot


*** Keywords ***
Criar Sessão no Restful Booker
    ${headers}  Create Dictionary  Accept=application/json    Content-Type=application/json
    Create Session    alias=RestfulBooker    url=${BASE_URI}    headers=${headers}    verify=${False}