*** Settings ***
Library  RequestsLibrary
Library  Collections
Resource  ../resources/auth.resource


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
    
    ${response}    POST On Session    RestfulBooker    /booking    json=${payload}
    Set Global Variable    ${booking_id}    ${response.json()["bookingid"]}
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
    ${response_update}    PUT On Session    RestfulBooker    /booking/${booking_id}
    ...                   headers=${auth_header} 
    ...                   json=${updated_payload}
Verificar se o update foi realizado
    ${response_check}    GET On Session    RestfulBooker    /booking/${booking_id}
    Should Be Equal As Strings    ${response_check.json()["firstname"]}    James
    Should Be True    ${response_check.json()["depositpaid"]}

Validar listagem de booking
    [Arguments]    ${status_code_desejado}

    ${response_get}    GET On Session    RestfulBooker    /booking    
    @{json}=    Set Variable    ${response_get.json()}
    ${length}=    Get Length    ${json}
    Should Be True    ${length} > 0

    FOR    ${item}    IN    @{json}
        Dictionary Should Contain Key    ${item}    bookingid
        ${id}=    Get From Dictionary    ${item}    bookingid
        Should Be True    ${id} > ${0}
    END

Fazer o update parcial de um Booking
    [Arguments]    ${status_code_desejado}

    ${cookies}    Create Dictionary      Cookie=token=${token}
    ${bookingdates}    Create Dictionary    checkin=2025-05-01    checkout=2025-05-05

    ${partial_updated_payload}    Create Dictionary
    ...        firstname=Linkin
    ...        lastname=Park
    
    ${auth_header}    Create Dictionary    Cookie=token=${token}
    ${response_update}    PATCH On Session    RestfulBooker    /booking/${booking_id}
    ...                   headers=${auth_header} 
    ...                   json=${partial_updated_payload}

Conferir atualização parcial
     ${response_check}    GET On Session    RestfulBooker    /booking/${booking_id}
    Should Be Equal As Strings    ${response_check.json()["firstname"]}    Linkin
    Should Be Equal As Strings    ${response_check.json()["lastname"]}    Park

Deletar o booking criado
    ${auth_header}    Create Dictionary    Cookie=token=${token}
    DELETE On Session    RestfulBooker    /booking/${booking_id}
    ...                  headers=${auth_header}
    Status Should Be    201

Verificar se foi deletado
    [Arguments]    ${status_code_desejado}
    Get On Session    RestfulBooker    /booking/${booking_id}    expected_status=any
    Status Should Be    ${status_code_desejado}