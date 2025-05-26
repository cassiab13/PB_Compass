*** Settings ***
Library  RequestsLibrary
Resource  dynamics.robot
Resource    statics.robot

*** Keywords ***
Realizar o login como administrador
    [Arguments]  ${status_code_desejado}
    ${auth}    Carregar Auth Admin
    
    ${response}  POST On Session
    ...          alias=RestfulBooker
    ...          url=/auth
    ...          json=${auth}
    ...          expected_status=${status_code_desejado}
    
    Set Global Variable    ${token}    ${response.json()["token"]}

Realizar o login com credenciais invalidas
    [Arguments]  ${tipo_credencial}  ${status_code_desejado}
    ${auth}    Run Keyword    Carregar Auth ${tipo_credencial}
    
    ${response}  POST On Session
    ...          alias=RestfulBooker
    ...          url=/auth
    ...          json=${auth}
    ...          expected_status=${status_code_desejado}
    
    [Return]    ${response}

Verificar se token foi gerado
    Should Not Be Empty    ${token}
    Log To Console    ${token}