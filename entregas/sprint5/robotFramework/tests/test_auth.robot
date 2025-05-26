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

Cenario 02: POST /auth 401 - Senha Incorreta
    [Tags]    POSTAuth
    Criar Sessão no Restful Booker
    ${response}    Realizar o login com credenciais invalidas    Senha Incorreta    status_code_desejado=200
    Should Not Contain    ${response.json()}    token

Cenario 03: POST /auth 401 - Usuario Incorreto
    [Tags]    POSTAuth
    Criar Sessão no Restful Booker
    ${response}    Realizar o login com credenciais invalidas    Usuario Incorreto    status_code_desejado=200
    Should Not Contain    ${response.json()}    token