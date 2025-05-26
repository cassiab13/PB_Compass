*** Settings ***
Documentation    Keywords e variáveis para geração de conteúdo dinâmico
Library    FakerLibrary
Library    OperatingSystem
Library    Collections
Library    DateTime

*** Keywords ***


# Gerar dados dinâmicos para booking
Gerar Dados Booking Dinamico
    ${firstname}    FakerLibrary.First Name
    ${lastname}    FakerLibrary.Last Name
    ${totalprice}    Evaluate    random.randint(100, 1000)    random
    ${depositpaid}    Evaluate    random.choice([True, False])    random
    
    # Gerar datas futuras para checkin e checkout
    ${checkin_date}    Get Current Date    increment=30 days    result_format=%Y-%m-%d
    ${checkout_date}    Get Current Date    increment=35 days    result_format=%Y-%m-%d
    
    &{bookingdates}    Create Dictionary    checkin=${checkin_date}    checkout=${checkout_date}
    
    # Lista de possíveis necessidades adicionais
    @{additionalneeds_options}    Create List    Breakfast    Airport Transfer    Extra Towels    Late Checkout    Early Check-in    None
    ${additionalneeds}    Evaluate    random.choice($additionalneeds_options)    random
    
    # Criar o dicionário de booking
    &{booking}    Create Dictionary
    ...    firstname=${firstname}
    ...    lastname=${lastname}
    ...    totalprice=${totalprice}
    ...    depositpaid=${depositpaid}
    ...    bookingdates=${bookingdates}
    
    # Adicionar additionalneeds apenas se não for "None"
    Run Keyword If    '${additionalneeds}' != 'None'    Set To Dictionary    ${booking}    additionalneeds=${additionalneeds}
    
    RETURN   ${booking}
