*** Settings ***
Resource  ../resources/booking.resource
Resource  ../resources/auth.resource
Resource  ../resources/create_session.resource

*** Test Cases ***
Cenario 01: PUT /booking 200
    Criar Sessão no Restful Broker
    Realizar o login como administrador    status_code_desejado=200
    Criar um novo booking
    Fazer o update de um Booking    status_code_desejado=200
    Verificar se o update foi realizado

Cenario 02: GET /booking 200
    Criar Sessão no Restful Broker
    Listar as reservas feitas    status_code_desejado=200
    Listar uma reserva específica por id
    