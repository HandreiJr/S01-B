class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"[{self.codinome}] usou a suprema!")


class HeroiTanque(HeroiOverwatch):

    def usar_suprema(self):
        print(f"[{self.codinome}] usou a suprema de Tanque: Impacto Sismico!")


class HeroiSuporte(HeroiOverwatch):

    def usar_suprema(self):
        print(f"[{self.codinome}] usou a suprema de Suporte: Matriz de Amplificacao!")

    def curar_equipe(self):
        print(f"[{self.codinome}] curou a equipe!")


if __name__ == "__main__":
    reinhardt = HeroiTanque("Reinhardt", "Tanque")
    mercy = HeroiSuporte("Mercy", "Suporte")

    equipe: list[HeroiOverwatch] = [reinhardt, mercy]

    for heroi in equipe:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()
