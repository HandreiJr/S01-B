#include <iostream>
#include <string>

using namespace std;

class MembroInatel {
protected:
    string nome;

public:
    MembroInatel(string n) : nome(n) {}

    virtual void identificar() {
        cout << "Membro: " << nome << endl;
    }

    virtual ~MembroInatel() {}
};

class Coordenador : public MembroInatel {
private:
    string departamento;

public:
    Coordenador(string n, string dep) : MembroInatel(n), departamento(dep) {}

    void identificar() override {
        cout << "Coordenador: " << nome << " - Departamento: " << departamento << endl;
    }
};

class Pesquisador : public MembroInatel {
private:
    string laboratorio;

public:
    Pesquisador(string n, string lab) : MembroInatel(n), laboratorio(lab) {}

    void identificar() override {
        cout << "Pesquisador: " << nome << " - Laboratorio: " << laboratorio << endl;
    }
};

int main() {
    MembroInatel* m1 = new Coordenador("Carlos", "GES");
    MembroInatel* m2 = new Pesquisador("Ana", "WOCA");

    m1->identificar();
    m2->identificar();

    delete m1;
    delete m2;

    return 0;
}