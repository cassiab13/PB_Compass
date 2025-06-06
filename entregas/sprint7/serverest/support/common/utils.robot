*** Settings ***
Documentation    Utils Keywords
Library          OperatingSystem
Resource         ../support/base.robot
Resource    ../../keywords/users/create_user_keywords.robot
Resource    ../../keywords/login/login_keyword.robot

*** Keywords ***
Get File User from fixtures
    ${json_string}=    Get File    ./support/fixtures/static/json/user.json
    ${json}=           Evaluate    __import__('json').loads("""${json_string}""")
    [Return]    ${json}


Gerar novo usuario
    ${novo_nome}=     FakerLibrary.Name
    ${nova_senha}=    FakerLibrary.Password    8    True    True    True
    ${novo_email}=    FakerLibrary.Email
    ${new_user}    Create Dictionary
    ...            nome=${novo_nome}
    ...            email=${novo_email}
    ...            password=${nova_senha}
    ...            administrador=true
    [Return]    ${new_user}

Gerar novo usuario com mesmo email
    [Arguments]    ${user_email}
    ${novo_nome}=     FakerLibrary.Name
    ${nova_senha}=    FakerLibrary.Password    8    True    True    True
    ${new_user}    Create Dictionary
    ...            nome=${novo_nome}
    ...            password=${nova_senha}
    ...            email=${user_email}
    ...            administrador=true
    Log To Console    ${new_user}
    [Return]    ${new_user}

Buscar usuario por ID
    [Arguments]    ${id}
    ${response}=    GET On Session
    ...             alias=Serverest
    ...             url=/usuarios/${id}
    ...             expected_status=200
    ${user_data}=   Convert To Dictionary    ${response.json()}
    [Return]    ${user_data}

Preparar Sessao para Rota Produtos
    Create Session on Serverest
    Cadastrar usuario valido    201
    Login com credenciais validas    200    ${valid_user}