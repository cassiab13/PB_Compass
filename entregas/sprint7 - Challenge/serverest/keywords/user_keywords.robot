*** Settings ***
Documentation    Keywords for the user endpoint
Library          OperatingSystem
Resource         ../support/base.robot

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
    
    Return From Keyword    ${response}

Cadastrar usuario com e-mail ja cadastrado
    [Arguments]    ${status_code_desejado}
    ${json_string}=    Get File    ./support/fixtures/static/json/user.json
    ${json}=           Evaluate    __import__('json').loads("""${json_string}""")
    ${valid_user}=     Set Variable    ${json["user"]["valid_user"]}

    POST On Session    alias=Serverest
    ...                url=/usuarios
    ...                json=${valid_user}
    

    ${json_string}=    Get File    ./support/fixtures/static/json/user.json
    ${json}=           Evaluate    __import__('json').loads("""${json_string}""")
    ${duplicate_email}=     Set Variable    ${json["user"]["duplicate_email"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${duplicate_email}
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Este email já está sendo usado

Cadastrar usuario com email dominio gmail
    ${json_string}=    Get File    ./support/fixtures/static/json/user.json
    ${json}=           Evaluate    __import__('json').loads("""${json_string}""")
    ${gmail}=     Set Variable    ${json["user"]["gmail"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${gmail}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Não é possível realizar o cadastro com gmail

Cadastrar usuario com email dominio hotmail
    ${json_string}=    Get File    ./support/fixtures/static/json/user.json
    ${json}=           Evaluate    __import__('json').loads("""${json_string}""")
    ${hotmail}=     Set Variable    ${json["user"]["hotmail"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${hotmail}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Não é possível realizar o cadastro com hotmail

Cadastrar usuario com email invalido
    [Arguments]    ${status_code_desejado}
    ${json_string}=    Get File    ./support/fixtures/static/json/user.json
    ${json}=           Evaluate    __import__('json').loads("""${json_string}""")
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
    ${json_string}=    Get File    ./support/fixtures/static/json/user.json
    ${json}=           Evaluate    __import__('json').loads("""${json_string}""")
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
    ${json_string}=    Get File    ./support/fixtures/static/json/user.json
    ${json}=           Evaluate    __import__('json').loads("""${json_string}""")
    ${more_then_10_password}=     Set Variable    ${json["user"]["more_then_10_password"]}
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/usuarios
    ...            json=${more_then_10_password}
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    password
    Should Be Equal As Strings    ${message}    Senha deve possuir de 5 a 10 caracteres