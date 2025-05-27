*** Settings ***
Documentation    Testes do Endpoint /booking API Restful Booker com dados dinâmicos
Resource         ../support/base.robot
Suite Setup      Setup para booking

*** Test Cases ***
Cenario 01: Criar um novo booking com dados dinâmicos
    [Tags]    POSTBookingDynamic    
    Status Should Be    200

Cenario 02: Atualizar um booking com dados dinâmicos
    [Tags]    PUTBookingDynamic
    Realizar o login como administrador    status_code_desejado=200
    ${updated_data}    ${update_response}    Fazer o update de um Booking    status_code_desejado=200    usar_dados_dinamicos=${True}
    Verificar se o update foi realizado    ${updated_data}

Cenario 03: Atualizar parcialmente um booking com dados dinâmicos
    [Tags]    PATCHBookingDynamic
    Realizar o login como administrador    status_code_desejado=200
    ${partial_data}    ${partial_response}    Fazer o update parcial de um Booking    status_code_desejado=200
    Conferir atualização parcial    ${partial_data}

Cenario 04: Deletar um booking criado com dados dinâmicos
    [Tags]    DELETEBookingDynamic
    Realizar o login como administrador    status_code_desejado=200
    Deletar o booking criado
    Verificar se foi deletado    404