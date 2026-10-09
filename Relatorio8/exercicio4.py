from abc import ABC, abstractmethod


class IUnidadeDeRede(ABC):

    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:

    def __init__(self, modelo: str):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):

    def __init__(self, nome: str, modelo_deck: str):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_deck)

    def executar_invasao(self):
        print(
            f"Netrunner {self.nome} usando Cyberdeck {self.cyberdeck.modelo} para quebrar o ICE de um servidor.")


class DroneDeVigilancia(IUnidadeDeRede):

    def __init__(self, codigo: str):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"Drone {self.codigo} interceptando o sinal da rede.")


class CelulaHacker:

    def __init__(self, nome: str, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self.membros = membros

    def iniciar_ataque(self):
        print(f"Celula Hacker '{self.nome}' iniciando ataque:")
        for membro in self.membros:
            membro.executar_invasao()


if __name__ == "__main__":
    netrunner = OperadorNetrunner("V", "Arasaka Mk.V")
    drone = DroneDeVigilancia("DRN-8820")

    celula = CelulaHacker("Voodoo Boys", [netrunner, drone])
    celula.iniciar_ataque()
