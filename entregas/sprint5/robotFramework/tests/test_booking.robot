*** Settings ***
Resource  ../resources/booking.resource
Resource  ../resources/auth.resource
Resource  ../resources/create_session.resource

*** Test Cases ***
#Cenário de listar por id validado no PUT/booking
#Cenário de criar um booking validado na Keyword Criar um novo booking
Cenario 01: PUT /booking 200
    [Tags]    PUTBooking
    Criar Sessão no Restful Booker
    Realizar o login como administrador    status_code_desejado=200
    Criar um novo booking
    Fazer o update de um Booking    status_code_desejado=200
    Verificar se o update foi realizado

Cenario 02: GET /booking 200
    [Tags]    GETBooking
    Criar Sessão no Restful Booker
    Validar listagem de booking    status_code_desejado=200


Cenario 03: PATCH /booking 200
    [Tags]    PATCHBooking
    Criar Sessão no Restful Booker
    Realizar o login como administrador    status_code_desejado=200
    Criar um novo booking
    Fazer o update parcial de um Booking    status_code_desejado=200
    Conferir atualização parcial

Cenario 04: DELETE /booking 201
    [Tags]    DELETEBooking
    Criar Sessão no Restful Booker
    Realizar o login como administrador    status_code_desejado=200
    Criar um novo booking
    Deletar o booking criado
    Verificar se foi deletado    status_code_desejado=404

Cenario 05: POST /booking com payload inválido 400
    [Tags]    POSTBooking    Negativo
    Criar Sessão no Restful Booker
    Criar booking com payload inválido    status_code_desejado=400
    Verificar resposta de erro para payload inválido