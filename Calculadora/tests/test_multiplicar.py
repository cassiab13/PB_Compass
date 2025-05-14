import pytest

@pytest.mark.parametrize("num1, num2, esperado", [(0,0,0), (1,2,2), (-1,-2,2), (-1,2,-2)])
def test_multiplicar(num1, num2, esperado):
    assert multiplicar(num1, num2) == esperado, "Teste da função multiplicar"