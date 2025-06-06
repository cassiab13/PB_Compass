*** Settings ***
Documentation    Testing the /produtos endpoint of the Serverest API
Resource         ../../../support/base.robot
Resource         ../../../keywords/produto/create_produto_keyword.robot
Resource         ../../../keywords/produto/delete_produto_keyword.robot
Resource    ../../../keywords/carrinho/create_carrinho_keyword.robot
Suite Setup      Preparar Sessao para Rota Produtos

*** Test Cases ***
CT035: Excluir produto existente e fora do carrinho
    [Tags]    CT035
    Cadastrar produto com usuario autenticado    201
    Excluir produto    200    ${product_id}
CT036: Excluir produto que está em um carrinho ativo
    [Tags]    CT036
    Cadastrar produto com usuario autenticado    201
    Criar carrinho valido    201    ${product_id}
    Excluir produto    400    ${product_id}
CT037: Excluir produto sem estar autenticado
    [Tags]    CT037
    Cadastrar produto com usuario autenticado    201
    Excluir produto sem estar autenticado    401    ${product_id}