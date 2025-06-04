*** Settings ***
Documentation    Keywords for the user endpoint
Resource         ../support/base.robot
Resource         ../support/common/utils.robot

*** Keywords ***
Listar todos usuarios
    [Arguments]    ${status_code_desejado}

    ${response}=    GET On Session
    ...             alias=Serverest
    ...             url=/usuarios
    ...             expected_status=${status_code_desejado}
    
    ${usuarios}=    Set Variable    ${response.json()["usuarios"]}
    ${quantidade}=  Set Variable    ${response.json()["quantidade"]}
    Should Not Be Empty    ${usuarios}
    Should Be True    ${quantidade} > 0

Listar usuario com ID valido
    [Arguments]     ${user_id}    ${user}   ${status_code_desejado}
    ${response}=    GET On Session
    ...             alias=Serverest
    ...             url=/usuarios/${user_id}
    ...             expected_status=${status_code_desejado}
    
    Should Be Equal   ${response.json()["nome"]}    ${user['nome']}
    Should Be Equal   ${response.json()["email"]}    ${user['email']}
    Should Be Equal   ${response.json()["password"]}    ${user['password']}
    Should Be Equal   ${response.json()["administrador"]}    ${user['administrador']}

Listar usuario com ID invalido
    [Arguments]    ${status_code_desejado}
    ${response}=    GET On Session
    ...             alias=Serverest
    ...             url=/usuarios/987654321zxywtrw
    ...             expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Usuário não encontrado