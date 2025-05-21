*** Settings ***
Documentation  Teste da API Restful Broker
Resource  ../resources/auth.resource
Resource  ../resources/create_session.resource

*** Test Cases ***
Cenario 01: POST /auth 200
    Criar Sessão no Restful Broker
    Realizar o login como administrador    status_code_desejado=200
    Verificar se token foi gerado