import pytest

@pytest.mark.parametrize("num1,num2,esperado", [(0.0,0.0,0.0), (1.0,2.5,3.5), (-1.0,-2.0,-3.0), (-1.0,2.5,1.5)])
def test_somar(num1,num2,esperado):
    assert somar(num1,num2) == esperado, "Teste da função somar"
