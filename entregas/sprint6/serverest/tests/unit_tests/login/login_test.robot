*** Settings ***
Documentation    Testing the /users endpoint of the Serverest API
Resource         ../../../keywords/login/login_keyword.robot
Resource         ../../../support/base.robot
Resource    ../../../keywords/users/create_user_keywords.robot
Suite Setup      Create Session on Serverest

*** Test Cases ***
CT020: Login com credenciais validas
    [Tags]    CT020
    Cadastrar usuario valido    201
    Login com credenciais validas    200    ${valid_user}

CT021: Login com email nao cadastrado
    [Tags]    CT021
    Login com email nao cadastrado    401

CT022: Login com senha incorreta
    [Tags]    CT022
    Cadastrar usuario valido    201
    Login com senha errada    401    ${valid_user}

CT023: Login com email em formato invalido
    [Tags]    CT023
    Cadastrar usuario valido    201
    Login com email em formato invalido    400    ${valid_user}

CT024: Login com payload incompleto
    [Tags]    CT024
    Cadastrar usuario valido    201
    Login com payload incompleto    400    ${valid_user}

CT025: Login com payload vazio
    [Tags]    CT025
    Login com payload vazio   400