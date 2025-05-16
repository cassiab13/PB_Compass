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

    def fatorial(self, num):
        if isinstance(num, float):
            raise ValueError("Náo é possível calcular fatorial de número decimal")
        elif num < 0:
            raise ValueError("Não é possível calcular fatorial de número negativo")
        elif num ==0:
            return 1
        else:
            fatorial = 1
            for i in range(1, num+1):
                fatorial *= i
            return fatorial
