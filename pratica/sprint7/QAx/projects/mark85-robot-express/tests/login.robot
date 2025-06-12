*** Settings ***
Documentation        Cenários de autenticação do usuário
Resource             ../resources/base.resource
Library              Collections
Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder logar com um usuário pré-cadastrado
    ${user}    Create Dictionary
    ...        name=Cassia
    ...        email=cy@gmail.com
    ...        password=pdw123
    
    Remove user from database      ${user}[email]
    Insert user into database      ${user}
    
    Submit login form              ${user}
    User should be logged in       ${user}[name]

Não deve logar com senha inválida
    ${user}    Create Dictionary
    ...        name=Cassia
    ...        email=cy@gmail.com
    ...        password=pdw123
    
    Remove user from database      ${user}[email]
    Insert user into database      ${user}
    
    Set To Dictionary              ${user}    password=abc123
    Submit login form              ${user}
    Notice should be               Ocorreu um erro
