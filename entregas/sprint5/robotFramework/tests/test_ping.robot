*** Settings ***
Resource  ../resources/ping.resource
Resource  ../resources/create_session.resource

*** Test Cases ***
Cenário 01: GET /ping 201
    [Tags]    GETPing
    Criar Sessão no Restful Booker
    Verificar se a API esta disponivel e rodando