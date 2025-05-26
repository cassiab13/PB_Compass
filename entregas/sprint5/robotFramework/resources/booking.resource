*** Settings ***
Library  RequestsLibrary
Library  Collections
Resource  auth.resource

*** Keywords ***
Criar um novo booking
    [Arguments]    ${usar_dados_dinamicos}=${False}
    
    # Usar dados dinâmicos ou estáticos
    ${payload}    Run Keyword If    ${usar_dados_dinamicos}    Gerar Dados Booking Dinamico
    ...    ELSE    Carregar JSON Booking Valido
    
    ${response}    POST On Session    RestfulBooker    /booking    json=${payload}
    Set Global Variable    ${booking_id}    ${response.json()["bookingid"]}
    RETURN    ${payload}    ${response}

Fazer o update de um Booking
    [Arguments]    ${status_code_desejado}    ${usar_dados_dinamicos}=${False}

    &{cookies}    Create Dictionary      Cookie=token=${token}
    ${booking_dates}    Create Dictionary    checkin=2025-05-01    checkout=2025-05-05     

    # Usar dados dinâmicos ou estáticos para o update
    ${updated_payload}    Run Keyword If    ${usar_dados_dinamicos}    Gerar Dados Booking Dinamico
    ...    ELSE    Create Dictionary
    ...        firstname=James
    ...        lastname=Brown
    ...        totalprice=${100}
    ...        depositpaid=${True}
    ...        bookingdates=${booking_dates}
    ...        additionalneeds=Breakfast
    
    &{auth_header}    Create Dictionary    Cookie=token=${token}
    ${response_update}    PUT On Session    RestfulBooker    /booking/${booking_id}
    ...                   headers=${auth_header} 
    ...                   json=${updated_payload}
    
    Log To Console   ${updated_payload}

    RETURN    ${updated_payload}    ${response_update}

Verificar se o update foi realizado
    [Arguments]    ${updated_payload}
    ${response_check}    GET On Session    RestfulBooker    /booking/${booking_id}
    Should Be Equal As Strings    ${response_check.json()["firstname"]}    ${updated_payload["firstname"]}
    Should Be Equal    ${response_check.json()["depositpaid"]}    ${updated_payload["depositpaid"]}

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

    # Gerar nomes dinâmicos para o update parcial
    ${firstname}    FakerLibrary.First Name
    ${lastname}    FakerLibrary.Last Name

    &{partial_updated_payload}    Create Dictionary
    ...        firstname=${firstname}
    ...        lastname=${lastname}
    
    &{auth_header}    Create Dictionary    Cookie=token=${token}
    ${response_update}    PATCH On Session    RestfulBooker    /booking/${booking_id}
    ...                   headers=${auth_header} 
    ...                   json=${partial_updated_payload}
    
    RETURN    ${partial_updated_payload}    ${response_update}

Conferir atualização parcial
    [Arguments]    ${partial_updated_payload}
    ${response_check}    GET On Session    RestfulBooker    /booking/${booking_id}
    Should Be Equal As Strings    ${response_check.json()["firstname"]}    ${partial_updated_payload["firstname"]}
    Should Be Equal As Strings    ${response_check.json()["lastname"]}    ${partial_updated_payload["lastname"]}

Deletar o booking criado
    &{auth_header}    Create Dictionary    Cookie=token=${token}
    DELETE On Session    RestfulBooker    /booking/${booking_id}
    ...                  headers=${auth_header}
    Status Should Be    201

Verificar se foi deletado
    [Arguments]    ${status_code_desejado}
    Get On Session    RestfulBooker    /booking/${booking_id}    expected_status=any
    Status Should Be    ${status_code_desejado}