class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} desferiu um ataque generico de aura contra a aranha ${alvo.nome}.`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} desferiu um soco com foco total em reforco contra a aranha ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transformou sua aura em eletricidade cortante contra a aranha ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} materializou correntes de energia contra a aranha ${alvo.nome}!`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;
    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`Localizacao da Trupe: ${this.cidade}`);
        this.#aranhas.forEach(aranha => {
            console.log(`Membro #${aranha.numero}: ${aranha.nome}`);
        });
    }

    buscarAranha(numero) {
        return this.#aranhas.find(aranha => aranha.numero === numero);
    }
}

const aranha1 = new Aranha('Feitan', 2);
const aranha2 = new Aranha('Machi', 3);

const trupe = new TrupeFantasma('Yorknew City', [aranha1, aranha2]);
trupe.revelarAranhas();

const aranhaAlvo = trupe.buscarAranha(2);

const usuariosNen = [
    new Intensificador('Gon'),
    new Transmutador('Killua'),
    new Materializador('Kurapika')
];

usuariosNen.forEach(usuario => {
    usuario.atacar(aranhaAlvo);
});