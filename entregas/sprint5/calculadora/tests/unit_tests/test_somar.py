import pytest
from calculadora.Calculadora import Calculadora

@pytest.mark.parametrize("num1,num2,esperado", [(0.0,0.0,0.0), (1.0,2.5,3.5), (-1.0,-2.0,-3.0), (-1.0,2.5,1.5)])
def test_somar_float(calc, num1,num2,esperado):
    assert calc.somar(num1,num2) == esperado, "Teste da função somar com números decimais"

@pytest.mark.parametrize("num1,num2,esperado", [(0,0,0), (1,2,3), (-1,-2,-3), (-1,2,1)])
def test_somar_inteiros(calc, num1,num2,esperado):
    assert calc.somar(num1,num2) == esperado, "Teste da função somar com números inteiros"