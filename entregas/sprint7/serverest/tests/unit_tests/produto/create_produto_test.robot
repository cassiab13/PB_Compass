*** Settings ***
Documentation    Testing the /produtos endpoint of the Serverest API
Resource         ../../../keywords/login/login_keyword.robot
Resource         ../../../support/base.robot
Resource         ../../../keywords/users/create_user_keywords.robot
Resource         ../../../keywords/produto/create_produto_keyword.robot
Suite Setup      Preparar Sessao para Rota Produtos

*** Test Cases ***
CT028: Cadastrar produto com usuario autenticado
    [Tags]    CT028
    Cadastrar produto com usuario autenticado    201 

CT030: Cadastrar produto sem usuario estar autenticado
    [Tags]    CT030
    Cadastrar produto com usuario nao autenticado    401

CT031: Cadastrar produto com campos obrigatorios ausentes
    [Tags]    CT031
    Cadastrar produto com campos obrigatorios ausentes    400
