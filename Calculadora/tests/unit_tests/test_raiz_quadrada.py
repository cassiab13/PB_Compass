import pytest
from calculadora.Calculadora import Calculadora

@pytest.mark.parametrize("num, esperado", [(0,0), (121,11), (0.25, 0.5)])
def test_raiz(calc, num, esperado):
    assert calc.raiz_quadrada(num) == esperado, "Teste de raiz quadrada com valores válidos"

def test_raiz_negativa(calc, esperado):
    with pytest.raises(ValueError, "Não há raiz quadrada de número negativo"):
        calc.raiz_quadrada(-4), "Tste de raiz quadrada com valor negativo"