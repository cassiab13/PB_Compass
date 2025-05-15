import pytest
from calculadora.Calculadora import Calculadora

@pytest.mark.parametrize("num1,num2,esperado", [(0.0,0.0,0.0), (1.5,2.0,-0.5), (3.0,2.0,1.0), (-1.75,-2.75,1)])
def test_subtrair_float(calc, num1, num2, esperado):
    assert calc.subtrair(num1, num2) == esperado, "Teste da função subtrair com números decimais"

@pytest.mark.parametrize("num1,num2,esperado", [(0,0,0), (1,2,-1), (3,2,1), (-1,-2,1)])
def test_subtrair_inteiros(calc, num1, num2, esperado):
    assert calc.subtrair(num1, num2) == esperado, "Teste da função subtrair com números inteiros"