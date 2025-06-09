*** Settings ***
Documentation    Keywords for the login endpoint
Library          OperatingSystem
Library          RequestsLibrary
Library          String
Resource         ../../support/base.robot
Resource         ../../support/common/utils.robot

*** Keywords ***
Login com credenciais validas
    [Arguments]    ${status_code_desejado}    ${user}

    ${payload}    Create Dictionary
    ...           email=${user["email"]}
    ...           password=${user["password"]}
    
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/login
    ...            json=${payload} 
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message 
    Should Be Equal As Strings    ${message}    Login realizado com sucesso

    ${authorization}=    Get From Dictionary    ${response.json()}    authorization
    ${token}=            Replace String    ${authorization}    Bearer
    ...                    ${EMPTY}
    ${token}=            Strip String     ${token}
    Set Global Variable   ${token}
    
    Log To Console    ${token}

Login com email nao cadastrado
    [Arguments]    ${status_code_desejado}
    ${payload}    Create Dictionary
    ...           email=email_inexistente@qa.com.br
    ...           password=123456
    
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/login
    ...            json=${payload} 
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${message}    Email e/ou senha inválidos

Login com senha errada
    [Arguments]    ${status_code_desejado}    ${user}
    ${payload}    Create Dictionary
    ...           email=${user["email"]}
    ...           password=123456
    
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/Login
    ...            json=${payload} 
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    message 
    Should Be Equal As Strings    ${message}    Email e/ou senha inválidos

Login com email em formato invalido
    [Arguments]    ${status_code_desejado}    ${user}
    ${payload}    Create Dictionary
    ...           email=abcdef.com.br
    ...           password=${user["password"]}
    
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/login
    ...            json=${payload} 
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    email
    Should Be Equal As Strings    ${message}    email deve ser um email válido

Login com payload incompleto
    [Arguments]    ${status_code_desejado}    ${user}
    ${payload}    Create Dictionary
    ...           email=
    ...           password=${user["password"]}
    
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/login
    ...            json=${payload} 
    ...            expected_status=${status_code_desejado}
    
    ${message}=    Get From Dictionary    ${response.json()}    email
    Should Be Equal As Strings    ${message}    email não pode ficar em branco

Login com payload vazio
    [Arguments]    ${status_code_desejado}
    ${payload}    Create Dictionary
    ...           email=
    ...           password=
    
    ${response}    POST On Session
    ...            alias=Serverest
    ...            url=/login
    ...            json=${payload} 
    ...            expected_status=${status_code_desejado}
    
    ${email}=    Get From Dictionary    ${response.json()}    email
    Should Be Equal As Strings    ${email}    email não pode ficar em branco

    ${password}=    Get From Dictionary    ${response.json()}    password
    Should Be Equal As Strings    ${password}    password não pode ficar em branco
