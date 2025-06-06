*** Settings ***
Documentation    Keywords for the user endpoint
Resource         ../../support/base.robot
Resource         ../../support/common/utils.robot

*** Keywords ***
Deletar usuario existente
    [Arguments]        ${status_code_desejado}    ${id}
    ${response}=    DELETE On Session
    ...             alias=Serverest
    ...             url=/usuarios/${id}
    ...             expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Registro excluído com sucesso

Deletar usuario com ID invalido
    [Arguments]    ${status_code_desejado}
    ${response}=    DELETE On Session
    ...             alias=Serverest
    ...             url=/usuarios/asdfewrqwe123456
    ...             expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Nenhum registro excluído