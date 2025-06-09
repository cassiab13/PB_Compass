*** Settings ***
Documentation    Keywords for the produtos endpoint
Library          OperatingSystem
Library          RequestsLibrary
Library          String
Resource         ../../support/base.robot
Resource         ../../support/common/utils.robot
Resource    ../users/create_user_keywords.robot
Resource    ../login/login_keyword.robot

*** Keywords ***
Cadastrar produto com usuario autenticado
    [Arguments]    ${status_code_desejado}
    
    ${produto}=    Generate dynamic data for Product

    ${headers}=    Create Dictionary
    ...            Authorization=Bearer ${token}
    ...            Content-Type=application/json
    
    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/produtos
    ...             json=${produto}
    ...             headers=${headers}
    ...             expected_status=${status_code_desejado}
    
    Set Global Variable    ${product_name}    ${produto["nome"]}
    Set Global Variable    ${product_qtd}     ${produto["quantidade"]}
    Set Global Variable    ${product_id}      ${response.json()["_id"]}
Cadastrar produto com usuario nao autenticado
    [Arguments]    ${status_code_desejado}
    ${produto}=    Generate dynamic data for Product
    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/produtos
    ...             json=${produto}
    ...             expected_status=${status_code_desejado}
    
Cadastrar produto com campos obrigatorios ausentes
    [Arguments]    ${status_code_desejado}
    ${produto}=    Generate dynamic data for Product
    
    ${produto_sem_nome}=    Create Dictionary
    ...                     preco=${produto["preco"]}
    ...                     descricao=${produto["descricao"]}
    ...                     quantidade=${produto["quantidade"]}
        
    ${headers}=    Create Dictionary
    ...            Authorization=Bearer ${token}
    ...            Content-Type=application/json

    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/produtos
    ...             json=${produto_sem_nome}
    ...             headers=${headers}
    ...             expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    nome
    Should Be Equal As Strings    ${message}    nome é obrigatório