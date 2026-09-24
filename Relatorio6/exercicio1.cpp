#include <iostream>
#include <string>

using namespace std;

class Robo {
private:
    string modelo;
    int versao;
    float potencialaser;
    int integridade;

public:
    Robo(string mod, int ver, float pot, int inte)
        : modelo(mod), versao(ver), potencialaser(pot), integridade(inte) {}

    void disparar(Robo &alvo) {
        alvo.integridade -= this->potencialaser;
    }

    void exibirStatus() {
        cout << modelo << " | Integridade: " << integridade << endl;
    }
};

int main() {
    Robo r1("Alpha", 1, 35.5, 100);
    Robo r2("Beta", 2, 42.0, 120);

    r1.disparar(r2);
    r2.disparar(r1);

    r1.exibirStatus();
    r2.exibirStatus();

    return 0;
}