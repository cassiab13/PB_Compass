*** Settings ***
Documentation    Keywords for the carrinhos endpoint
Library          OperatingSystem
Library          RequestsLibrary
Library          String
Resource         ../../support/base.robot
Resource         ../../support/common/utils.robot
Resource         ../produto/create_produto_keyword.robot
Resource         ../produto/get_produto_keyword.robot

*** Keywords ***
Criar carrinho valido
    [Arguments]    ${status_code_desejado}    ${id}
   
    ${headers}=    Create Dictionary
    ...            Authorization=Bearer ${token}
    ...            Content-Type=application/json

    ${produto}=    Create Dictionary
    ...            idProduto=${id}
    ...            quantidade=1
    
    ${lista_produtos}=    Create List
    Append To List    ${lista_produtos}    ${produto}

    ${payload}=    Create Dictionary
    ...            produtos=${lista_produtos}
    
    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/carrinhos
    ...             json=${payload}
    ...             headers=${headers}
    ...             expected_status=${status_code_desejado}
    
    Set Global Variable    ${carter_id}    ${response.json()["_id"]}
    Should Be Equal As Strings    ${response.json()["message"]}    Cadastro realizado com sucesso

Criar carrinho sem estar autenticado
    [Arguments]    ${status_code_desejado}    ${id}

    ${produto}=    Create Dictionary
    ...            idProduto=${id}
    ...            quantidade=1
    
    ${lista_produtos}=    Create List
    Append To List    ${lista_produtos}    ${produto}

    ${payload}=    Create Dictionary
    ...            produtos=${lista_produtos}
    
    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/carrinhos
    ...             json=${payload}
    ...             expected_status=${status_code_desejado}
    
    Should Be Equal As Strings    ${response.json()["message"]}    Token de acesso ausente, inválido, expirado ou usuário do token não existe mais

Criar carrinho com produto inexistente
    [Arguments]    ${status_code_desejado}

    ${id}=    Generate dynamic ID

    ${produto}=    Create Dictionary
    ...            idProduto=${id}
    ...            quantidade=1
    
    ${lista_produtos}=    Create List
    Append To List    ${lista_produtos}    ${produto}

    ${payload}=    Create Dictionary
    ...            produtos=${lista_produtos}
    
    ${headers}=    Create Dictionary
    ...            Authorization=Bearer ${token}
    ...            Content-Type=application/json
    
    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/carrinhos
    ...             json=${payload}
    ...             headers=${headers}
    ...             expected_status=${status_code_desejado}
    
    Should Be Equal As Strings    ${response.json()["message"]}    Produto não encontrado

Criar carrinho duplicado
    [Arguments]    ${status_code_desejado}    ${id}
   
    ${headers}=    Create Dictionary
    ...            Authorization=Bearer ${token}
    ...            Content-Type=application/json

    ${produto}=    Create Dictionary
    ...            idProduto=${id}
    ...            quantidade=1
    
    ${lista_produtos}=    Create List
    Append To List    ${lista_produtos}    ${produto}

    ${payload}=    Create Dictionary
    ...            produtos=${lista_produtos}
    
    ${response}=    POST On Session
    ...             alias=Serverest
    ...             url=/carrinhos
    ...             json=${payload}
    ...             headers=${headers}
    ...             expected_status=${status_code_desejado}
    
    Should Be Equal As Strings    ${response.json()["message"]}    Não é permitido ter mais de 1 carrinho

Verificar reducao de estoque
  [Arguments]    ${status_code_desejado}    ${quantidade}
  ${qtd_int}=    Convert To Integer    ${quantidade}
  ${qtd_prod_int}=    Convert To Integer    ${produto["quantidade"]}
  Should Be True    ${qtd_int}-1 == ${qtd_prod_int}
    

    