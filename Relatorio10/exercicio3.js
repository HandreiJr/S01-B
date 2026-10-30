class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `Criatura: ${this.criatura} | Nivel de Perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas = [];
    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        const novaFicha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(novaFicha);
    }

    exibirFichas() {
        console.log(`Diario Numero: ${this.numero}`);
        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios = [];
    constructor(dono) {
        this.dono = dono;
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`Dono da Cabana: ${this.dono}`);
        this.#funcionarios.forEach(func => {
            console.log(`Funcionario: ${func.nome} - Cargo: ${func.cargo}`);
        });
    }
}

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomo da Floresta', 'Baixo');
diario.anotar('Bill Cipher', 'Extremo');
diario.exibirFichas();

const func1 = new Funcionario('Soos', 'Caixa');
const func2 = new Funcionario('Wendy', 'Atendente');

const cabana = new CabanaDoMisterio('Stan Pines');
cabana.contratar(func1);
cabana.contratar(func2);
cabana.abrirAsPortas();