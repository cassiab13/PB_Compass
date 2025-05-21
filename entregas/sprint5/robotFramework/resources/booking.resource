*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections
Resource  ../resources/auth.resource

*** Variables ***
${booking_id}    1

*** Keywords ***
Criar um novo booking
    ${bookingdates}    Create Dictionary    checkin=2025-05-01    checkout=2025-05-05

    ${payload}    Create Dictionary
    ...           firstname=Johnny
    ...           lastname=Brown
    ...           totalprice=${100}
    ...           depositpaid=${False}
    ...           bookingdates=${bookingdates}
    ...           additionalneeds=Breakfast
    
    ${response}    POST On Session    RestfulBroker    /booking    json=${payload}
    ${booking_id}    Set Variable    ${response.json()["bookingid"]}
Fazer o update de um Booking
    [Arguments]    ${status_code_desejado}

    ${cookies}    Create Dictionary      Cookie=token=${token}
    ${bookingdates}    Create Dictionary    checkin=2025-05-01    checkout=2025-05-05

    ${updated_payload}    Create Dictionary
    ...        firstname=James
    ...        lastname=Brown
    ...        totalprice=${100}
    ...        depositpaid=${True}
    ...        bookingdates=${booking_dates}
    ...        additionalneeds=Breakfast
    
    ${auth_header}    Create Dictionary    Cookie=token=${token}
    ${response_update}    PUT On Session    RestfulBroker    /booking/${booking_id}
    ...                   headers=${auth_header} 
    ...                   json=${updated_payload}
Verificar se o update foi realizado
    ${response_check}    GET On Session    RestfulBroker    /booking/${booking_id}
    Should Be Equal As Strings    ${response_check.json()["firstname"]}    James
    Should Be True    ${response_check.json()["depositpaid"]}