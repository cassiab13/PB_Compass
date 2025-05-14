import pytest
import time

def soma(a, b):
    return a + b

def multiplica(a,b):
    return a * b

@pytest.mark.lento
def test_soma_lenta():
    time.sleep(2)
    assert soma(2,2) == 4

def test_soma_rapida():
    assert soma (2,3) == 5

def test_multiplica_rapida():
    time.sleep(2)
    assert multiplica(2,2) == 4

@pytest.mark.lento
def test_multiplica_lenta():
    assert multiplica(2,3) == 6