*** Settings ***
Documentation    Keywords for the produtos endpoint
Library          OperatingSystem
Library          RequestsLibrary
Library          String
Resource         ../../support/base.robot
Resource         ../../support/common/utils.robot

*** Keywords ***
Excluir produto
    [Arguments]    ${status_code_desejado}    ${id}

    ${headers}=    Create Dictionary
    ...            Authorization=Bearer ${token}
    ...            Content-Type=application/json
    
    ${response}=    DELETE On Session
    ...             alias=Serverest
    ...             url=/produtos/${id}
    ...             headers=${headers}
    ...             expected_status=${status_code_desejado}
Excluir produto sem estar autenticado
    [Arguments]    ${status_code_desejado}    ${id}

    ${response}=    DELETE On Session
    ...             alias=Serverest
    ...             url=/produtos/${id}
    ...             expected_status=${status_code_desejado}

    Should Be Equal As Strings    ${response.json()["message"]}    Token de acesso ausente, inválido, expirado ou usuário do token não existe mais    