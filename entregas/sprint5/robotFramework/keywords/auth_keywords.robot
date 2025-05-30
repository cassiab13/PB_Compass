*** Settings ***
Documentation    Keywords para endpoint /auth
Resource         ../support/base.robot


*** Keywords ***
Requisitar token
    [Arguments]    ${auth_payload}    ${status_code_desejado}
    ${response}    POST On Session
    ...            alias=RestfulBooker
    ...            url=/auth
    ...            json=${auth_payload}
    ...            expected_status=${status_code_desejado}
    RETURN    ${response}
Realizar o login como administrador
    [Arguments]      ${status_code_desejado}
    ${auth}          Carregar Auth Admin
    ${response}      Requisitar token    ${auth}    ${status_code_desejado}
    Set Global Variable    ${token}    ${response.json()["token"]}

Realizar o login com credenciais invalidas
    [Arguments]  ${tipo_credencial}  ${status_code_desejado}
    ${auth}      Run Keyword    Carregar Auth ${tipo_credencial}
    ${response}  Requisitar token    ${auth}    ${status_code_desejado}    
    RETURN    ${response}

Verificar se token foi gerado
    Should Not Be Empty    ${token}
    Log To Console    ${token}