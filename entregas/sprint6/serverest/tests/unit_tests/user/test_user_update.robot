*** Settings ***
Documentation    Testing the /users endpoint of the Serverest API
Resource         ../../../keywords/users/update_user_keywords.robot
Resource        ../../../keywords/users/create_user_keywords.robot
Suite Setup      Create Session on Serverest

*** Test Cases ***
CT012: Atualizar usuario existente com novos dados
    [Tags]    CT012
    Cadastrar usuario valido    201
    ${new_user}=    Gerar novo usuario
    Atualizar usuario com ID existente    200    ${user_id}    ${new_user}
CT013: Atualizar usuario com ID inexistente
    [Tags]    CT013
    ${user_updated}=    Gerar novo usuario
    Atualizar usuario com ID inexistente    201    ${user_updated}

CT014: Atualizar usuario com e-mail ja existente
    [Tags]    CT014
    Cadastrar usuario valido    201
    ${user_updated}=    Gerar novo usuario com mesmo email    ${user_email}
    Atualizar usuario com mesmo e-mail    400    ${user_updated}    ${user_id}
