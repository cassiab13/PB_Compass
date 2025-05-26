*** Settings ***
Documentation    Keywords e variáveis para geração de conteúdo estático
Library    FakerLibrary
Library    OperatingSystem
Library    Collections
Library    DateTime

*** Keywords ***

# Carregar dados de autenticação
Carregar Auth Admin
    ${json}    Get File    ${EXECDIR}/json/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['valid']['admin']    json
    RETURN    ${auth}

Carregar Auth Senha Incorreta
    ${json}    Get File    ${EXECDIR}/json/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['invalid']['wrong_password']    json
    RETURN    ${auth}

Carregar Auth Usuario Incorreto
    ${json}    Get File    ${EXECDIR}/json/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['invalid']['wrong_username']    json
    RETURN    ${auth}

Carregar Auth Usuario Vazio
    ${json}    Get File    ${EXECDIR}/json/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['invalid']['empty_username']    json
    RETURN    ${auth}

Carregar Auth Senha Vazia
    ${json}    Get File    ${EXECDIR}/json/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['invalid']['empty_password']    json
    RETURN    ${auth}

Carregar Auth Sem Usuario
    ${json}    Get File    ${EXECDIR}/json/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['invalid']['missing_username']    json
    RETURN    ${auth}

Carregar Auth Sem Senha
    ${json}    Get File    ${EXECDIR}/json/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['invalid']['missing_password']    json
    RETURN    ${auth}

# Carregar dados de booking
Carregar JSON Booking Valido
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['valid']['standard']    json
    RETURN    ${booking}

Carregar JSON Booking Sem Necessidades Adicionais
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['valid']['no_additionalneeds']    json
    RETURN    ${booking}

Carregar JSON Booking Sem Deposito
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['valid']['no_deposit']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Sem Nome
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['missing_firstname']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Sem Sobrenome
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['missing_lastname']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Sem Datas
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['missing_bookingdates']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Sem Data Checkin
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['missing_checkin']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Sem Data Checkout
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['missing_checkout']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Preco Negativo
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['negative_price']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Checkout Antes Checkin
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['checkout_before_checkin']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Datas Passadas
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['past_dates']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Preco String
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['string_price']    json
    RETURN    ${booking}

Carregar JSON Booking Invalido Deposito String
    ${json}    Get File    ${EXECDIR}/json/bookings.json
    ${booking}    Evaluate    json.loads('''${json}''')['bookings']['invalid']['string_depositpaid']    json
    RETURN    ${booking}