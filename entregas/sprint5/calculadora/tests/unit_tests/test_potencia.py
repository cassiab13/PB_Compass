import pytest
from calculadora.Calculadora import Calculadora

@pytest.mark.parametrize("base, expoente, esperado", [(0,0,1), (3,2,9), (-2,2,4), (-1,-5, -1)])
def test_potencia_inteiros(calc, base, expoente, esperado):
    assert calc.potencia(base, expoente) == esperado, "Teste de potencia com inteiro"

@pytest.mark.parametrize("base, expoente, esperado", [(0.0, 0.0, 1.0), (2.0, 3.0, 8.0), (2.0, -2.0, 0.25), (9.0, 0.5, 3.0), (-2.0, 3.0, -8.0)])
def test_potencia_float(calc, base, expoente, esperado):
    assert calc.potencia(base, expoente) == esperado, "Teste de potência com float"


