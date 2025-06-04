*** Settings ***
Documentation    Keywords for the user endpoint
Resource         ../support/base.robot
Resource         ../support/common/utils.robot

*** Keywords ***
Atualizar usuario com ID existente
    [Arguments]    ${status_code_desejado}    ${id}    ${new_user}
    
    ${user_updated}=  PUT On Session
    ...              alias=Serverest
    ...              url=/usuarios/${id}
    ...              json=${new_user}
    ...              expected_status=${status_code_desejado}

    ${response}=    Buscar usuario por ID    ${id}
    Should Be Equal    ${response["nome"]}             ${new_user["nome"]}
    Should Be Equal    ${response["email"]}            ${new_user["email"]}
    Should Be Equal    ${response["password"]}         ${new_user["password"]}
    Should Be Equal    ${response["administrador"]}    ${new_user["administrador"]}
    
Atualizar usuario com ID inexistente
    [Arguments]    ${status_code_desejado}    ${user}

    ${response}=     PUT On Session
    ...              alias=Serverest
    ...              url=/usuarios/123456789abcdefg
    ...              json=${user}
    ...              expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}       Cadastro realizado com sucesso

Atualizar usuario com mesmo e-mail
    [Arguments]    ${status_code_desejado}    ${user}    ${id}
    ${response}=     PUT On Session
    ...              alias=Serverest
    ...              url=/usuarios/123456789abcdefh
    ...              json=${user}
    ...              expected_status=${status_code_desejado}

    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Este email já está sendo usado