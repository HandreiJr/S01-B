#include <iostream>
#include <string>

using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa(string n, int i) : nome(n), idade(i) {}

    string getNome() { return nome; }
    int getIdade() { return idade; }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int nv) : Pessoa(n, i), nivel(nv) {}

    void exibir() {
        cout << getNome() << " - Idade: " << getIdade() << " - Nivel: " << nivel << endl;
    }
};

class Personagem : public Pessoa {
private:
    string rank;

public:
    Personagem(string n, int i, string r) : Pessoa(n, i), rank(r) {}

    void exibir() {
        cout << getNome() << " - Idade: " << getIdade() << " - Rank: " << rank << endl;
    }
};

int main() {
    Protagonista p("Arthur", 25, 99);
    Personagem npc("Guarda", 40, "B");

    p.exibir();
    npc.exibir();

    return 0;
}