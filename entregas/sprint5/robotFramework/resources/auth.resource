*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections

*** Keywords ***
Realizar o login como administrador
    [Arguments]  ${status_code_desejado}
    ${body}  Create Dictionary
    ...      username=admin
    ...      password=password123

    ${response}  POST On Session
    ...          alias=RestfulBroker
    ...          url=/auth
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
    
    Set Global Variable    ${token}    ${response.json()["token"]}

Verificar se token foi gerado
    Should Be Empty    ${token}
    Log To Console    ${token}


