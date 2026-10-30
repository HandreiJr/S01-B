class Pokemon {
    #vida;
    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida -= pontos;
        if (this.#vida < 0) {
            this.#vida = 0;
        }
        console.log(`${this.apelido} ficou com ${this.#vida} de vida.`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} desferiu um ataque generico.`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Jato de Agua!`);
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Chicote de Cipo!`);
        alvo.sofrerDano(15);
    }
}

const squirtle = new Squirtle('Squirt', 100);
const bulbasaur = new Bulbasaur('Bulba', 30);

bulbasaur.atacar(squirtle);
squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

console.log(`Vida do Squirtle: ${squirtle.vida}`);
console.log(`Vida do Bulbasaur: ${bulbasaur.vida}`);