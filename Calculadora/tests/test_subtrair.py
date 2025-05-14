import pytest

@pytest.mark.parametrize("num1,num2,esperado", [(0.0,0.0,0.0), (1.5,2.0,-0.5), (3.0,2.0,1.0), (-1.75,-2.75,1)])
def test_subtrair(num1, num2, esperado):
    assert subtrair(num1, num2) == esperado, "Teste da função subtrair"
