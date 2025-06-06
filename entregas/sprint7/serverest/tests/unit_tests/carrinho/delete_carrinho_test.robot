*** Settings ***
Documentation    Testing the /produtos endpoint of the Serverest API
Resource         ../../../support/base.robot
Resource         ../../../support/common/utils.robot
Resource         ../../../keywords/produto/create_produto_keyword.robot
Resource         ../../../keywords/carrinho/create_carrinho_keyword.robot
Resource         ../../../keywords/carrinho/delete_carrinho_keyword.robot
Suite Setup      Preparar Sessao para Rota Produtos

*** Test Cases ***
CT050: Excluir carrinho existente
    [Tags]    CT050
    Cadastrar produto com usuario autenticado    201
    Criar carrinho valido    201    ${product_id}
    Excluir carrinho   200
CT051: Excluir carrinho e usuário com token inválido
    [Tags]    CT051
    Cadastrar produto com usuario autenticado    201
    Criar carrinho valido    201    ${product_id}
    Excluir carrinho com token invalido    401
CT052: Excluir carrinho e retornar produtos ao estoque
    [Tags]    CT052
    Cadastrar produto com usuario autenticado    201
    Criar carrinho valido    201    ${product_id}
    Excluir carrinho e retornar produtos para estoque    200