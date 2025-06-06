*** Settings ***
Documentation    Keywords for the carrinhos endpoint
Library          OperatingSystem
Library          RequestsLibrary
Library          String
Resource         ../../support/base.robot
Resource         ../../support/common/utils.robot

*** Keywords ***
Excluir carrinho
    [Arguments]    ${status_code_desejado}
    
    ${headers}=    Create Dictionary
    ...            Authorization=Bearer ${token}
    ...            Content-Type=application/json
    
    ${response}=    DELETE On Session
    ...             alias=Serverest
    ...             url=/carrinhos/concluir-compra
    ...             headers=${headers}
    ...             expected_status=${status_code_desejado}
    
    ${mensagem}=    Get From Dictionary    ${response.json()}    message 
    Should Be Equal As Strings    ${mensagem}    Registro excluído com sucesso