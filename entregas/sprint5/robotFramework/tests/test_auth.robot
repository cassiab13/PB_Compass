*** Settings ***
Documentation  Teste do Endpoint /auth da API Restful Booker
Resource       ../keywords/auth_keywords.robot
Suite Setup    Criar Sessão no Restful Booker

*** Test Cases ***
Cenario 01: POST /auth 200
    [Tags]    POSTAuth    
    Realizar o login como administrador    status_code_desejado=200
    Verificar se token foi gerado

Cenario 02: POST /auth 401 - Senha Incorreta
    [Tags]    POSTAuth
    ${response}    Realizar o login com credenciais invalidas    Senha Incorreta    status_code_desejado=200
    Should Not Contain    ${response.json()}    token

Cenario 03: POST /auth 401 - Usuario Incorreto
    [Tags]    POSTAuth
    ${response}    Realizar o login com credenciais invalidas    Usuario Incorreto    status_code_desejado=200
    Should Not Contain    ${response.json()}    token