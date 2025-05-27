*** Settings ***
Resource  ../support/base.robot

*** Keywords ***
Criar um novo booking
    [Arguments]    ${status_code_desejado}    ${usar_dados_dinamicos}=${False}
    ${payload}    Importar Dados Dinamicos ou Estaticos    ${usar_dados_dinamicos}
    ${response}    POST On Session    
    ...    alias=RestfulBooker
    ...    url=/booking    
    ...    json=${payload}
    Set Global Variable    ${booking_id}    ${response.json()["bookingid"]}
    RETURN    ${payload}    ${response}

Fazer o update de um Booking
    [Arguments]    ${status_code_desejado}    ${usar_dados_dinamicos}=${False}
    ${payload}    Importar Dados Dinamicos ou Estaticos    ${usar_dados_dinamicos}
    &{auth_header}    Create Dictionary    Cookie=token=${token}
    ${response_update}    PUT On Session    RestfulBooker    /booking/${booking_id}
    ...    headers=${auth_header}
    ...    json=${payload}
    Should Be Equal As Integers    ${response_update.status_code}    ${status_code_desejado}
    Log To Console    Status esperado: ${status_code_desejado}
    Log To Console    Resposta: ${response_update.status_code}
    RETURN    ${payload}    ${response_update}



Verificar se o update foi realizado
    [Arguments]    ${updated_payload}
    ${response_check}    GET On Session    alias=RestfulBooker    url=/booking/${booking_id}
    Should Be Equal As Strings    ${response_check.json()["firstname"]}    ${updated_payload["firstname"]}
    Should Be Equal    ${response_check.json()["depositpaid"]}    ${updated_payload["depositpaid"]}

Validar listagem de booking
    [Arguments]    ${status_code_desejado}

    ${response_get}    GET On Session    alias=RestfulBooker    url=/booking    
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
    ${firstname}    FakerLibrary.First Name
    ${lastname}    FakerLibrary.Last Name

    &{partial_updated_payload}    Create Dictionary
    ...        firstname=${firstname}
    ...        lastname=${lastname}
    
    &{auth_header}    Create Dictionary    Cookie=token=${token}
    ${response_update}    PATCH On Session    alias=RestfulBooker    url=/booking/${booking_id}
    ...                   headers=${auth_header} 
    ...                   json=${partial_updated_payload}
    
    RETURN    ${partial_updated_payload}    ${response_update}

Conferir atualização parcial
    [Arguments]    ${partial_updated_payload}
    ${response_check}    GET On Session    alias=RestfulBooker    url=/booking/${booking_id}
    Should Be Equal As Strings    ${response_check.json()["firstname"]}    ${partial_updated_payload["firstname"]}
    Should Be Equal As Strings    ${response_check.json()["lastname"]}    ${partial_updated_payload["lastname"]}

Deletar o booking criado
    &{auth_header}    Create Dictionary    Cookie=token=${token}
    DELETE On Session    alias=RestfulBooker    url=/booking/${booking_id}
    ...                  headers=${auth_header}
    Status Should Be    201

Verificar se foi deletado
    [Arguments]    ${status_code_desejado}
    Get On Session    alias=RestfulBooker    url=/booking/${booking_id}    expected_status=any
    Status Should Be    ${status_code_desejado}