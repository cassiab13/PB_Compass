*** Settings ***
Documentation    Testing the /produtos endpoint of the Serverest API
Resource         ../../../support/base.robot
Resource         ../../../keywords/produto/create_produto_keyword.robot
Resource         ../../../keywords/produto/delete_produto_keyword.robot
Resource         ../../../keywords/carrinho/create_carrinho_keyword.robot
Suite Setup      Preparar Sessao para Rota Produtos

*** Test Cases ***
CT042: Criar carrinho com um ou mais produtos válidos
    [Tags]    CT042
    Cadastrar produto com usuario autenticado    201
    Criar carrinho valido    201    ${product_id}
CT043: Criar carrinho sem estar autenticado
    [Tags]    CT043
    Cadastrar produto com usuario autenticado    201
    Criar carrinho sem estar autenticado    401    ${product_id}
CT044: Criar carrinho com produto inexistente
    [Tags]    CT044
    Criar carrinho com produto inexistente    400
CT045: Criar carrinho quando o usuário já possui carrinho ativo
    [Tags]    CT045
    Cadastrar produto com usuario autenticado    201
    Criar carrinho valido    201    ${product_id}
    Cadastrar produto com usuario autenticado    201
    Criar carrinho duplicado    400    ${product_id}
CT046: Criar carrinho e verificar redução no estoque
    [Tags]    CT046
    Cadastrar produto com usuario autenticado    201
    Listar produto por ID    200    ${product_id}
    Criar carrinho valido    201    ${product_id}
    Listar produto por ID    200    ${product_id}
    Verificar reducao de estoque    200    ${product_qtd}