#include <iostream>
#include <string>
#include <vector>

using namespace std;

class MembroConselho {
public:
    virtual void saudar() {
        cout << "Saudacao generica do conselho." << endl;
    }

    virtual ~MembroConselho() {}
};

class Anao : public MembroConselho {
public:
    void saudar() override {
        cout << "Saudacao do Anao: Pelas barbas dos meus ancestrais!" << endl;
    }
};

class Orc : public MembroConselho {
public:
    void saudar() override {
        cout << "Saudacao do Orc: Forca e honra!" << endl;
    }
};

class Draconato : public MembroConselho {
public:
    void saudar() override {
        cout << "Saudacao do Draconato: Que as chamas o guiem." << endl;
    }
};

int main() {
    vector<MembroConselho*> conselho;

    conselho.push_back(new Anao());
    conselho.push_back(new Orc());
    conselho.push_back(new Draconato());

    for (MembroConselho* membro : conselho) {
        membro->saudar();
    }

    for (MembroConselho* membro : conselho) {
        delete membro;
    }

    return 0;
}