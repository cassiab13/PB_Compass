import pytest

def fatorial(n):
    if n == 0:
        return 1
    else:
        return n * fatorial(n-1)

@pytest.mark.parametrize('n, esperado',[(0, 1), (1, 1), (5, 120)])
def test_fatorial(n, esperado):
    assert fatorial(n) == esperado