import pytest
from calculadora.Calculadora import Calculadora

@pytest.mark.parametrize("porcentagem, num, esperado", [(0,0,0), (20, 100, 20), (5, -100, -5)])
def test_porcentagem_inteiro(calc, porcentagem, num, esperado):
    assert calc.porcentagem(porcentagem, num) == esperado, "Teste de porcentagem com inteiro"

@pytest.mark.parametrize("porcentagem, num, esperado", [(0.5, 100.00, 0.5), (0.5, -100.0, -0.5)])
def test_porcentagem_float(calc, porcentagem, num, esperado):
    assert calc.porcentagem(porcentagem, num) == esperado, "Teste de porcentagem com float"