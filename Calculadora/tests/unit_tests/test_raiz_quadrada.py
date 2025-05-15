import pytest
from calculadora.Calculadora import Calculadora

@pytest.mark.parametrize("num, esperado", [(0,0), (121,11), (0.25, 0.5)])
def test_raiz(calc, num, esperado):
    assert calc.raiz_quadrada(num) == esperado, "Teste de raiz quadrada com valores válidos"

def test_raiz_negativa(calc):
    with pytest.raises(ValueError) as e:
        calc.raiz_quadrada(-4)
    assert str(e.value) == "Não há raiz quadrada de número negativo", "Tste de raiz quadrada com valor negativo"