*** Settings ***
Documentation    Keywords e variáveis para geração de conteúdo estático
Library          OperatingSystem
Library          Collections
Library          DateTime

*** Keywords ***

# Auth
Load Valid Auth Admin
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['valid']    json

Load Duplicate Email
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['duplicate_email']    json

Load Gmail
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['gmail']    json

Load Hotmail
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['hotmail']    json

Load Invalid Email
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['invalid_email']    json

Load Password Less then 5
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['less_then_5_password']    json

Load Password More then 10
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['more_then_10_password']    json

Load Admin Equal False
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['admin_false']    json

Load No Payload
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['no_payload']    json

Load Missing Field
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['missing_field']    json

Load Extra Field
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/auth.json
    ${auth}    Evaluate    json.loads('''${json}''')['auth']['extra_field']    json

#Login
Load Valid Login
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/login.json
    ${auth}    Evaluate    json.loads('''${json}''')['login']['valid']    json

Load Not Registered Email
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/login.json
    ${auth}    Evaluate    json.loads('''${json}''')['login']['not_registered_email']    json

Load Wrong Password
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/login.json
    ${auth}    Evaluate    json.loads('''${json}''')['login']['wrong_password']    json

Load Invalid Email on Login
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/login.json
    ${auth}    Evaluate    json.loads('''${json}''')['login']['invalid_email']    json

Load Incomplete Payload
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/login.json
    ${auth}    Evaluate    json.loads('''${json}''')['login']['incomplete_payload']    json

Load Empty Payload
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/login.json
    ${auth}    Evaluate    json.loads('''${json}''')['login']['empty_payload']    json

Load Unnecessary Payload
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/login.json
    ${auth}    Evaluate    json.loads('''${json}''')['login']['unnecessary_payload']    json


#ID
Load Valid ID
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/id.json
    ${auth}    Evaluate    json.loads('''${json}''')['id']['valid']    json

Load Invalid ID
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/id.json
    ${auth}    Evaluate    json.loads('''${json}''')['id']['invalid']    json

#Product

Load Valid Product
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/product.json
    ${auth}    Evaluate    json.loads('''${json}''')['product']['valid']    json

Load Invalid Product
    ${json}    Get File    ${EXECDIR}/support/fixtures/static/product.json
    ${auth}    Evaluate    json.loads('''${json}''')['product']['invalid']    json
