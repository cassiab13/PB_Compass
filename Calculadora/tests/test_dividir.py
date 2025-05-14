import pytest

@pytest.mark.parametrize("num1, num2, esperado", [(0.0, 3.5,0.0), (24.0, 2.0, 12.0), (35.0, -7.0, -5.0), (-42.0, -6.0, 7.0)])
def test_dividir(num1, num2, esperado):
    assert dividir(num1, num2) == esperado

def test_dividir_por_zero():
    with pytest.raises(ValueError) as e:
        dividir(10.0, 0.0)
    
    assert str(e.value) == "Não é possível dividir por zero"