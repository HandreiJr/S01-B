#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    int matriz_solar[5][5] = {0};
    int opcao = 0;
    
    while (opcao != 3) {
        cout << "\n=== TELEMETRIA DO PAINEL SOLAR ===\n";
        cout << "1. Ativar Celula\n";
        cout << "2. Ver Mapa da Matriz\n";
        cout << "3. Sair\n";
        cout << "Escolha uma opcao: ";
        cin >> opcao;
        
        if (opcao == 1) {
            int f, c;
            cout << "Digite a fileira (0-4): ";
            cin >> f;
            cout << "Digite a coluna (0-4): ";
            cin >> c;
            
            if (f >= 0 && f <= 4 && c >= 0 && c <= 4) {
                if (matriz_solar[f][c] == 0) {
                    matriz_solar[f][c] = 1;
                    cout << "Sucesso: Celula solar ativada!\n";
                } else {
                    cout << "Erro: Celula solar ja esta em operacao!\n";
                }
            } else {
                cout << "Erro: Coordenadas fora do limite da matriz.\n";
            }
        } 
        else if (opcao == 2) {
            cout << "Mapa da Matriz Solar\n";
            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 5; j++) {
                    cout << "[" << matriz_solar[i][j] << "] ";
                }
                cout << "\n";
            }
        }
    }
    
    int celulas_ativas = 0;
    int celulas_inativas = 0;
    
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (matriz_solar[i][j] == 1) {
                celulas_ativas++;
            } else {
                celulas_inativas++;
            }
        }
    }
    
    float percentual = (float)celulas_ativas / 25.0f * 100.0f;
    
    cout << "\n=== RELATORIO FINAL DE OPERACAO ===\n";
    cout << "Total de celulas ATIVAS: " << celulas_ativas << "\n";
    cout << "Total de celulas INATIVAS: " << celulas_inativas << "\n";
    cout << fixed << setprecision(2);
    cout << "Capacidade Operacional: " << percentual << "%\n";
    
    return 0;
}