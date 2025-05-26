*** Settings ***
Documentation    Testes da API Restful Booker com dados dinâmicos
Resource    ../resources/booking.resource
Resource    ../resources/auth.resource
Resource    ../resources/create_session.resource

*** Test Cases ***
Cenario 01: Criar um novo booking com dados dinâmicos
    [Tags]    POSTBookingDynamic
    Criar Sessão no Restful Booker
    ${booking_data}    ${response}    Criar um novo booking    usar_dados_dinamicos=${True}
    Status Should Be    200
    Log    Booking criado com ID: ${booking_id}
    Log    Dados do booking: ${booking_data}

Cenario 02: Atualizar um booking com dados dinâmicos
    [Tags]    PUTBookingDynamic
    Criar Sessão no Restful Booker
    ${booking_data}    ${response}    Criar um novo booking    usar_dados_dinamicos=${True}
    Realizar o login como administrador    status_code_desejado=200
    ${updated_data}    ${update_response}    Fazer o update de um Booking    status_code_desejado=200    usar_dados_dinamicos=${True}
    Verificar se o update foi realizado    ${updated_data}

Cenario 03: Atualizar parcialmente um booking com dados dinâmicos
    [Tags]    PATCHBookingDynamic
    Criar Sessão no Restful Booker
    ${booking_data}    ${response}    Criar um novo booking    usar_dados_dinamicos=${True}
    Realizar o login como administrador    status_code_desejado=200
    ${partial_data}    ${partial_response}    Fazer o update parcial de um Booking    status_code_desejado=200
    Conferir atualização parcial    ${partial_data}

Cenario 04: Deletar um booking criado com dados dinâmicos
    [Tags]    DELETEBookingDynamic
    Criar Sessão no Restful Booker
    ${booking_data}    ${response}    Criar um novo booking    usar_dados_dinamicos=${True}
    Realizar o login como administrador    status_code_desejado=200
    Deletar o booking criado
    Verificar se foi deletado    404