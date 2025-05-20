import pytest
from calculadora.Calculadora import Calculadora

@pytest.fixture(scope="module")
def calc():
    return Calculadora()