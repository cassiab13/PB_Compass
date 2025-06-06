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
Atualizar produto com ID inexistente
    [Arguments]    ${status_code_desejado}

    ${produto}=    Generate dynamic data for Product
    ${id}=    Generate dynamic ID

    ${headers}=    Create Dictionary
    ...            Authorization=Bearer ${token}
    ...            Content-Type=application/json
    
    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/produtos/${id}
    ...             json=${produto}
    ...             headers=${headers}
    ...             expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Produto não encontrado
Atualizar produto com nome ja utilizado
    [Arguments]    ${status_code_desejado}     ${id}    ${product_name}

    ${produto}=    Generate dynamic data for Product

    ${produto_atualizado}=    Create Dictionary
    ...                       nome=${product_name}
    ...                       preco=${produto["preco"]}
    ...                       descricao=${produto["descricao"]}
    ...                       quantidade=${produto["quantidade"]}
    
    ${headers}=    Create Dictionary
    ...            Authorization=Bearer ${token}
    ...            Content-Type=application/json
    
    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/produtos/${id}
    ...             json=${produto_atualizado}
    ...             headers=${headers}
    ...             expected_status=${status_code_desejado}
Atualizar produto com token invalido
    [Arguments]    ${status_code_desejado}    ${id}
    ${produto}=    Generate dynamic data for Product

    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/produtos/${id}
    ...             json=${produto}
    ...             expected_status=${status_code_desejado}
    
