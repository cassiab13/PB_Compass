*** Settings ***
Documentation    Teste do Endpoint /ping da API Restful Booker
Resource         ../keywords/ping_keywords.robot
Suite Setup      Criar Sessão no Restful Booker

*** Test Cases ***

Cenário 01: GET /ping 201
    [Tags]    GETPing
    Verificar se a API esta disponivel e rodando