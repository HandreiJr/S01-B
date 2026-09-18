#include <iostream>
#include <iomanip>

using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {
    float prob_conjunta = 1.0f;
    for (int i = 0; i < tamanho; i++) {
        prob_conjunta *= probabilidades[i];
    }
    return prob_conjunta;
}

int main() {
    int n;
    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n;
    
    float* probabilidades = new float[n];
    
    for (int i = 0; i < n; i++) {
        cout << "Digite a probabilidade do componente " << (i + 1) << " (ex: 0.95): ";
        cin >> probabilidades[i];
    }
    
    float confiabilidade = calcular_confiabilidade_sistema(probabilidades, n);
    
    cout << fixed << setprecision(4);
    cout << "Confiabilidade total do sistema: " << confiabilidade << " (";
    cout << setprecision(2) << confiabilidade * 100.0f << "%)\n";
         
    delete[] probabilidades;
    return 0;
}