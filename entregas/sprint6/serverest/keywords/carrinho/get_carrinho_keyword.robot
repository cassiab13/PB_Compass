*** Settings ***
Documentation    Keywords for the carrinhos endpoint
Library          OperatingSystem
Library          RequestsLibrary
Library          String
Resource         ../../support/base.robot
Resource         ../../support/common/utils.robot

*** Keywords ***
Listar carrinhos
    [Arguments]    ${status_code_desejado}

    ${response}=    GET On Session
    ...             alias=Serverest
    ...             url=/carrinhos
    ...             expected_status=${status_code_desejado}
    
    Should Not Be Empty  ${response.json()}

Listar carrinho por ID
    [Arguments]    ${status_code_desejado}    ${id}

    ${response}    GET On Session
    ...            alias=Serverest
    ...            url=/carrinhos/${id}
    ...            expected_status=${status_code_desejado}

Listar carrinho com ID invalido
    [Arguments]    ${status_code_desejado}
    ${id}=    Generate dynamic ID

    ${response}=    GET On Session
    ...             alias=Serverest
    ...             url=/carrinhos/${id}
    ...             expected_status=${status_code_desejado}
    
    ${mensagem}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${mensagem}    Carrinho não encontrado