*** Settings ***
Documentation    Keywords and variables for dynamic content
Library          FakerLibrary
Library          Collections

*** Keywords ***

Generate dynamic data for Product
    ${nome}        FakerLibrary.Name
    ${preco}       FakerLibrary.Pyfloat
    ${descricao}   FakerLibrary.Words
    ${quantidade}  FakerLibrary.Random Int

    ${produto}    Create Dictionary
    ...           nome=${nome}
    ...           preco=${preco}
    ...           descricao=${descricao}
    ...           quantidade=${quantidade}

    RETURN    ${produto}

Generate dynamic data for User
    ${nome}        FakerLibrary.Name
    ${email}       FakerLibrary.Email
    ${password}    FakerLibrary.Password    length=6    special_chars=${True}    digits=${True}

    ${usuario}    Create Dictionary
    ...           nome=${nome}
    ...           email=${email}
    ...           password=${password}
    ...           administrador=true
    
    RETURN    ${usuario}