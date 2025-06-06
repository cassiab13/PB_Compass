*** Settings ***
Documentation    Testing the /users endpoint of the Serverest API
Resource         ../../../keywords/users/create_user_keywords.robot
Resource         ../../../keywords/users/delete_user_keywords.robot
Suite Setup      Create Session on Serverest

*** Test Cases ***
CT018: Deletar usuario existente
    [Tags]    CT018
    Cadastrar usuario valido    201
    Deletar usuario existente   200    ${user_id}

CT019: Deletar usuario com ID invalido
    [Tags]    CT019
    Deletar usuario com ID invalido    200