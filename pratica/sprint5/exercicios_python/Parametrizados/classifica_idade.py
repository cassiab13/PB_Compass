def classifica_idade(idade):
    if idade < 12:
        return "Criança"
    elif idade < 18:
        return "Adolescente"
    elif idade < 65:
        return "Adulto"
    else:
        return "Idoso"