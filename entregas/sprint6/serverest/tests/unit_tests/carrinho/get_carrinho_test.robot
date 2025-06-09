*** Settings ***
Documentation    Testing the /produtos endpoint of the Serverest API
Resource         ../../../support/base.robot
Resource         ../../../support/common/utils.robot
Resource         ../../../keywords/carrinho/create_carrinho_keyword.robot
Resource         ../../../keywords/carrinho/get_carrinho_keyword.robot

Suite Setup      Preparar Sessao para Rota Produtos

*** Test Cases ***
CT047: Listar carrinhos existentes
    [Tags]    CT047
    Cadastrar produto com usuario autenticado    201
    Criar carrinho valido    201    ${product_id}
    Listar carrinhos    200
CT048: Buscar carrinho por ID válido
    [Tags]    CT048
    Cadastrar produto com usuario autenticado    201
    Criar carrinho valido    201    ${product_id}
    Listar carrinho por ID    200    ${carter_id}
CT049: Buscar carrinho por ID inválido
    [Tags]    CT049
    Cadastrar produto com usuario autenticado    201
    Criar carrinho valido    201    ${product_id}
    Listar carrinho com ID invalido      400
