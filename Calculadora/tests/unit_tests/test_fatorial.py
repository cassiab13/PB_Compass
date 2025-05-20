import pytest
from calculadora.Calculadora import Calculadora

@pytest.mark.parametrize("num, esperado", [(1,1), (5,120), (25, 15511210043330985984000000)])
def test_fatorial_inteiros(calc, num , esperado):
    assert calc.fatorial(num) == esperado

def test_fatorial_negativo(calc):
    with pytest.raises(ValueError) as e:
        calc.fatorial(-10)
        assert str(e.value) == "Não é possível calcular fatorial de número negativo"

def test_fatorial_decimal(calc):
    with pytest.raises(ValueError) as e:
        calc.fatorial(2.5)
        assert str(e.value) == "Náo é possível calcular fatorial de número decimal"

def test_fatorial_zero(calc):
    assert calc.fatorial(0) == 1
