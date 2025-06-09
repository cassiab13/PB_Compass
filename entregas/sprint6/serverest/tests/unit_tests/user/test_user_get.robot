*** Settings ***
Documentation    Testing the /users endpoint of the Serverest API
Resource    ../../../keywords/users/create_user_keywords.robot
Resource    ../../../keywords/users/get_user_keywords.robot
Suite Setup      Create Session on Serverest

*** Test Cases ***
CT015: Listar todos usuarios
    [Tags]    CT015
    Listar todos usuarios    200

CT016: Listar usuario com ID valido
    [Tags]    CT016
    Cadastrar usuario valido    201
    Listar usuario com ID valido    ${user_id}    ${valid_user}    200

CT017: Listar usuario com ID invalido
    [Tags]    CT017
    Listar usuario com ID invalido    400