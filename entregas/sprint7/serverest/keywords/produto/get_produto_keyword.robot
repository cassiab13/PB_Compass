*** Settings ***
Documentation    Keywords for the produtos endpoint
Library          OperatingSystem
Library          RequestsLibrary
Library          String
Resource         ../../support/base.robot
Resource         ../../support/common/utils.robot
Resource         ../users/create_user_keywords.robot
Resource         ../login/login_keyword.robot

*** Keywords ***
Listar todos os produtos
    [Arguments]    ${status_code_desejado}

     ${response}=   GET On Session
    ...             alias=Serverest
    ...             url=/produtos
    ...             expected_status=${status_code_desejado}
    
    ${quantidade}=     Get From Dictionary    ${response.json()}    quantidade
    ${produtos}=       Get From Dictionary    ${response.json()}    produtos
    Should Be True         ${quantidade} > 0
    Should Not Be Empty    ${produtos}

Listar produto por ID
    [Arguments]    ${status_code_desejado}     ${id}

    ${response}=    GET On Session
    ...             alias=Serverest
    ...             url=/produtos/${id}
    ...             expected_status=${status_code_desejado}
    
    Set Global Variable    ${produto}    ${response.json()}
#TODO: Validar resposta enviada

Listar produto por ID invalido
    [Arguments]    ${status_code_desejado}
    ${id}=    Generate dynamic ID

    ${response}=    GET On Session
    ...             alias=Serverest
    ...             url=/produtos/${id}
    ...             expected_status=${status_code_desejado}
    
    ${mensagem}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${mensagem}    Produto não encontrado
