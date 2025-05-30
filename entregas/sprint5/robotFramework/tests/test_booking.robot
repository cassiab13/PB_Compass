*** Settings ***
Documentation    Teste do Endpoint /booking da API Restful Booker com dados estáticos
Resource         ../support/base.robot
Suite Setup      Setup para booking
*** Test Cases ***
Cenario 01: PUT /booking 200
    [Tags]    PUTBooking
    ${updated_payload}    
    ...    ${response_update}=    Fazer o update de um Booking
    ...    status_code_desejado=200
    Verificar se o update foi realizado    ${updated_payload}


Cenario 02: GET /booking 200
    [Tags]    GETBooking
    Validar listagem de booking    status_code_desejado=200


Cenario 03: PATCH /booking 200
    [Tags]    PATCHBooking
    Fazer o update parcial de um Booking    status_code_desejado=200
    ${partial_updated_payload}    ${response_update}=    Fazer o update parcial de um Booking    status_code_desejado=200
    Conferir atualização parcial    ${partial_updated_payload}

Cenario 04: DELETE /booking 201
    [Tags]    DELETEBooking
    Deletar o booking criado
    Verificar se foi deletado    status_code_desejado=404