*** Settings ***
Documentation  Teste da API Restful Booker
Resource  ../resources/auth.resource
Resource  ../resources/create_session.resource

*** Test Cases ***
Cenario 01: POST /auth 200
    [Tags]    POSTAuth
    Criar Sessão no Restful Booker
    Realizar o login como administrador    status_code_desejado=200
    Verificar se token foi gerado