import pytest
from calculadora.Calculadora import Calculadora

@pytest.fixture(scope="session")
def calc():
    return Calculadora()