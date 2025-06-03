*** Settings ***
Documentation    Testing the /users endpoint of the Serverest API
Resource         ../keywords/user_keywords.robot
Suite Setup      Create Session on Serverest

*** Test Cases ***
CT001: Criar usuário válido
    [Tags]    CT001
    Cadastrar usuario valido    201

CT002: Criar usuário com e-mail ja cadastrado
    [Tags]    CT002
    Cadastrar usuario com e-mail ja cadastrado    400

CT003: Criar usuário com e-mail de domínio gmail.com
    [Tags]    CT003
    Cadastrar usuario com email dominio gmail

CT004: Criar usuário com e-mail de domínio hotmail.com
    [Tags]    CT004
    Cadastrar usuario com email dominio hotmail

CT005: Criar usuário com e-mail em formato inválido
    [Tags]    CT005
    Cadastrar usuario com email invalido    400

CT006: Criar usuário com senha menor que 5 caracteres
    [Tags]    CT006
    Cadastrar usuario com senha menor que 5 caracteres    400

CT007: Criar usuário com senha maior que 10 caracteres
    [Tags]    CT007
    Cadastrar usuario com senha maior que 10 caracteres    400