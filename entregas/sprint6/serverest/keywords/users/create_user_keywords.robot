*** Settings ***
Documentation    Keywords for the user endpoint
Library          OperatingSystem
Library          RequestsLibrary
Resource         ../../support/base.robot
Resource         ../../support/common/utils.robot

*** Keywords ***
Cadastrar usuario valido
    [Arguments]    ${status_code_desejado}

    ${valid_user}=     Generate dynamic data for User
    Set Global Variable    ${valid_user}    ${valid_user}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${valid_user}
    ...            expected_status=${status_code_desejado}
    
    Set Global Variable    ${user_id}    ${response.json()["_id"]}
    ${user_email}=    Get From Dictionary    ${valid_user}    email
    Set Global Variable    ${user_email}
    Return From Keyword    ${response.json()}
Cadastrar usuario com e-mail ja cadastrado
    [Arguments]    ${status_code_desejado}
    ${json}=      Get File User from fixtures
    ${valid_user}=     Set Variable    ${json["user"]["valid_user"]}

    POST On Session    alias=Serverest
    ...                url=/usuarios
    ...                json=${valid_user}
    

    ${json}=        Get File User from fixtures
    ${duplicate_email}=     Set Variable    ${json["user"]["duplicate_email"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${duplicate_email}
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Este email já está sendo usado

Cadastrar usuario com email dominio gmail
    ${json}=       Get File User from fixtures
    ${gmail}=      Set Variable    ${json["user"]["gmail"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${gmail}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Não é possível realizar o cadastro com gmail

Cadastrar usuario com email dominio hotmail
    ${json}=      Get File User from fixtures
    ${hotmail}=     Set Variable    ${json["user"]["hotmail"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${hotmail}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Não é possível realizar o cadastro com hotmail

Cadastrar usuario com email invalido
    [Arguments]    ${status_code_desejado}
    ${json}=        Get File User from fixtures
    ${invalid_email}=     Set Variable    ${json["user"]["invalid_email"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${invalid_email}
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    email
    Should Be Equal As Strings    ${message}    email deve ser um email válido

Cadastrar usuario com senha menor que 5 caracteres
    [Arguments]    ${status_code_desejado}
    ${json}=       Get File User from fixtures
    ${less_then_5_password}=     Set Variable    ${json["user"]["less_then_5_password"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${less_then_5_password}
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    password
    Should Be Equal As Strings    ${message}    Senha deve possuir de 5 a 10 caracteres

Cadastrar usuario com senha maior que 10 caracteres
    [Arguments]    ${status_code_desejado}
    ${json}=       Get File User from fixtures
    ${more_then_10_password}=     Set Variable    ${json["user"]["more_then_10_password"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${more_then_10_password}
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    password
    Should Be Equal As Strings    ${message}    Senha deve possuir de 5 a 10 caracteres

Cadastrar usuario com admin false
    [Arguments]     ${status_code_desejado}
    ${json}=    Get File User from fixtures
    ${admin_false}=    Set Variable    ${json["user"]["admin_false"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${admin_false}
    ...            expected_status=${status_code_desejado}
    
    ${message}=     Get From Dictionary    ${response.json()}    message 
    Should Be Equal As Strings    ${message}    Cadastro realizado com sucesso

Cadastrar usuario com payload vazio
    [Arguments]    ${status_code_desejado}
    ${json}=    Get File User from fixtures
    ${payload_vazio}=    Set Variable    ${json["user"]["no_payload"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${payload_vazio}
    ...            expected_status=${status_code_desejado}
    
    ${message}=     Get From Dictionary    ${response.json()}    nome 
    Should Be Equal As Strings    ${message}    nome não pode ficar em branco
    ${message}=     Get From Dictionary    ${response.json()}    email 
    Should Be Equal As Strings    ${message}    email não pode ficar em branco
    ${message}=     Get From Dictionary    ${response.json()}    password
    Should Be Equal As Strings    ${message}    password não pode ficar em branco
    ${message}=     Get From Dictionary    ${response.json()}    administrador
    Should Be Equal As Strings    ${message}    administrador deve ser 'true' ou 'false'

Cadastrar usuario com campos extras
    [Arguments]    ${status_code_desejado}
    ${json}=    Get File User from fixtures
    ${payload_extra}=    Set Variable    ${json["user"]["extra_field"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${payload_extra}
    ...            expected_status=${status_code_desejado}
    
    ${message}=     Get From Dictionary    ${response.json()}    extra 
    Should Be Equal As Strings    ${message}    extra não é permitido