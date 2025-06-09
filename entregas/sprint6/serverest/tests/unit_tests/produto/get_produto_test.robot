*** Settings ***
Documentation    Testing the /produtos endpoint of the Serverest API
Resource         ../../../keywords/login/login_keyword.robot
Resource         ../../../support/base.robot
Resource         ../../../keywords/produto/get_produto_keyword.robot
Resource         ../../../keywords/produto/create_produto_keyword.robot
Suite Setup      Preparar Sessao para Rota Produtos

*** Test Cases ***
CT038: Listar todos os produtos
    [Tags]    CT038
    Listar todos os produtos    200

CT039: Buscar produto por ID válido
    [Tags]    CT039
    Cadastrar produto com usuario autenticado    201
    Listar produto por ID    200    ${product_id}

CT040: Buscar produto por ID inválido
    [Tags]    CT040
    Listar produto por ID invalido    400

