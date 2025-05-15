class Calculadora:
    def somar(self, num1, num2):
        return num1 + num2

    def subtrair(self, num1, num2):
        return num1 - num2

    def multiplicar(self, num1, num2):
        return num1 * num2

    def dividir(self, num1, num2):
        if num2 == 0:
            raise ValueError("Não é possível dividir por zero")
        return num1 / num2

    def potencia(self, base, expoente):
        return base**expoente

    def raiz_quadrada(self, num):
        if num < 0:
            raise ValueError("Não há raiz quadrada de número negativo")
        return num**(1/2)

    def porcentagem(self, porcentagem, num):
        return (porcentagem/100)*num