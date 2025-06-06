*** Settings ***
Documentation    Testing the /produtos endpoint of the Serverest API
Resource         ../../../keywords/login/login_keyword.robot
Resource         ../../../support/base.robot
Resource         ../../../keywords/users/create_user_keywords.robot
Resource         ../../../keywords/produto/create_produto_keyword.robot
Resource         ../../../keywords/produto/update_produto_keyword.robot
Suite Setup      Preparar Sessao para Rota Produtos

*** Test Cases ***
CT032: Atualizar produto com ID inexistente
    [Tags]    CT032
    Atualizar produto com ID inexistente   405

CT033: Atualizar produto com nome já utilizado
    [Tags]    CT033
    Cadastrar produto com usuario autenticado    201
    Atualizar produto com nome ja utilizado    405     ${product_id}   ${product_name}
CT034: Atualizar produto com token invalido
    [Tags]    CT034
    Cadastrar produto com usuario autenticado    201
    Atualizar produto com token invalido    405   ${product_id}