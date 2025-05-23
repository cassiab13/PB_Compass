*** Settings ***
Library  RequestsLibrary

*** Keywords ***
Verificar se a API esta disponivel e rodando
    ${response}  GET On Session
    ...          alias=RestfulBooker
    ...          url=/ping
    
    Status Should Be    201