import pytest
from calculadora.Calculadora import Calculadora

@pytest.mark.parametrize("num1, num2, esperado", [(0.0, 3.5,0.0), (24.5, 5.0, 4.9), (36.4, -7.0, -5.2), (-43.2, -6.0, 7.2), (6.3, 1, 6.3)])
def test_dividir_float(calc, num1, num2, esperado):
    assert calc.dividir(num1, num2) == esperado, "Teste da função dividir com números decimais"

@pytest.mark.parametrize("num1, num2, esperado", [(0, 3,0), (25, 5, 5), (35, -7, -5), (-42, -6, 7), (5,1,5)])
def test_dividir_inteiros(calc, num1, num2, esperado):
    assert calc.dividir(num1, num2) == esperado, "Teste da função dividir com números inteiros"

def test_dividir_por_zero(calc):
    with pytest.raises(ValueError) as e:
        calc.dividir(10.0, 0.0)
    
    assert str(e.value) == "Não é possível dividir por zero", "Teste da função dividir com divisor igual a zero"