*** Settings ***
Library  RequestsLibrary

*** Keywords ***
Realizar o login como administrador
    [Arguments]  ${status_code_desejado}
    &{body}  Create Dictionary
    ...      username=admin
    ...      password=password123

    ${response}  POST On Session
    ...          alias=RestfulBooker
    ...          url=/auth
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
    
    Set Global Variable    ${token}    ${response.json()["token"]}

Verificar se token foi gerado
    Should Not Be Empty    ${token}
    Log To Console    ${token}


