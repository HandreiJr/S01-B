class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;
    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error('O metodo usarHabilidade deve ser implementado pelas subclasses.');
    }

    entrarEmCombate() {
        console.log(`Codinome: ${this.codinome} | Pistola: ${this.#pistola.modelo} | Habilidade: ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Implantar fumaca orb';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Lancar flecha de reconhecimento';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'Ativar maldade orbital e avancar';
    }
}

class Esquadrao {
    #agentes;
    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`Esquadrao: ${this.nome}`);
        this.#agentes.forEach(agente => agente.entrarEmCombate());
    }

    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}

const c1 = new Controlador('Omen', 'Classic');
const c2 = new Controlador('Viper', 'Ghost');
const i1 = new Iniciador('Sova', 'Sheriff');
const d1 = new Duelista('Jett', 'Vandal');

const esquadrao = new Esquadrao('Alfa', [c1, c2, i1, d1]);
esquadrao.iniciarPartida();

esquadrao.listarControladores().forEach(controlador => {
    console.log(`Controlador encontrado: ${controlador.codinome}`);
});