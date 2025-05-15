import pytest
from calculadora.Calculadora import Calculadora

@pytest.mark.parametrize("num1, num2, esperado", [(0,0,0), (1,2,2), (-1,-2,2), (-1,2,-2)])
def test_multiplicar_inteiros(calc, num1, num2, esperado):
    assert calc.multiplicar(num1, num2) == esperado, "Teste da função multiplicar com números inteiros"

@pytest.mark.parametrize("num1, num2, esperado", [(0.0,0.0,0.0), (1.5,2.5,3.75), (-1.75,-2.5,4.375), (-1.5,2.1,-3.15)])
def test_multiplicar_float(calc, num1, num2, esperado):
    assert round(calc.multiplicar(num1, num2), 10)  == esperado, "Teste da função multiplicar com números decimais"
