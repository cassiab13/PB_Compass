*** Settings ***
Documentation        Keywords e Variaveis para Ações Gerais
Library              OperatingSystem
Resource             ../base.robot

*** Keywords ***
Importar Dados Dinamicos ou Estaticos
    [Arguments]    ${usar_dados_dinamicos}=${False}
    ${booking_dates}    Create Dictionary    checkin=2025-05-01    checkout=2025-05-05

    ${payload}    Run Keyword If    ${usar_dados_dinamicos}
    ...    Gerar Dados Booking Dinamico
    ...    ELSE
    ...    Create Dictionary
    ...        firstname=James
    ...        lastname=Brown
    ...        totalprice=${100}
    ...        depositpaid=${True}
    ...        bookingdates=${booking_dates}
    ...        additionalneeds=Breakfast

    RETURN    ${payload}


Setup para booking
    Criar Sessão no Restful Booker
    Realizar o login como administrador    status_code_desejado=200
    ${booking_data}    ${response}=    Criar um novo booking    ${True}
