# 🧮 Calculadora em Python

Este projeto é uma implementação de uma **calculadora matemática** com funcionalidades básicas e avançadas, desenvolvida em Python. Inclui uma suíte robusta de **testes unitários automatizados** com `pytest`.

---

## 🚀 Funcionalidades

A calculadora implementa os seguintes métodos:

- `somar(a, b)`
- `subtrair(a, b)`
- `multiplicar(a, b)`
- `dividir(a, b)`
- `potencia(base, expoente)`
- `raiz_quadrada(x)`
- `porcentagem`
- `fatorial(n)`

---

## 🧪 Testes Automatizados

Os testes são realizados com o framework [**pytest**](https://docs.pytest.org/), e incluem:

- **Cobertura de todos os métodos**
- Uso de **`@pytest.mark.parametrize`** para testar múltiplos cenários com diferentes entradas
- Uso de **`fixture`** para inicializar a instância da calculadora antes de cada teste
- Verificação de **exceções esperadas** com `pytest.raises`

## ▶️ Como executar os testes
No terminal, dentro da raiz do projeto, digite:

<pre>pytest tests/</pre>

Ou se quiser visualizar a cobertura:

<pre>pytest --cov=calculadora tests/</pre>

## 🛠️ Sugestões de Melhoria
Sugestões de melhoria e/ou correções são bem-vindas.