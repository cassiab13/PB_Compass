*** Settings ***
Documentation    Keywords and variables for dynamic content
Library          FakerLibrary
Library          Collections

*** Keywords ***

Generate dynamic data for Product
    ${nome}        FakerLibrary.Name Nonbinary
    ${preco}       FakerLibrary.Pyint
    ${descricao}   FakerLibrary.Color Name
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

Generate dynamic ID
    ${id}    FakerLibrary.Password    length=16    special_chars=${False}   upper_case=${False}  lower_case=${True}
    RETURN    ${id}