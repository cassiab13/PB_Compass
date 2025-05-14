import pytest

@pytest.fixture
def numeros():
    return [2,3]

def soma_dobro(numeros):
    return sum(x * 2 for x in numeros)

def test_soma_dobro(numeros):
    assert soma_dobro(numeros) == 10
