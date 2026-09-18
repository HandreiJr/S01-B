#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    float capacidade_maxima;
    float carga_atual = 0.0f;
    int opcao = 0;
    
    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidade_maxima;
    
    while (opcao != 4) {
        cout << "\n=== SISTEMA DE CARGA DO DRONE ===\n";
        cout << "1. Verificar Carga\n";
        cout << "2. Carregar Pacote\n";
        cout << "3. Descarregar Pacote\n";
        cout << "4. Encerrar Operacao\n";
        cout << "Escolha uma opcao: ";
        cin >> opcao;
        
        if (opcao == 1) {
            cout << fixed << setprecision(2);
            cout << "Carga Atual: " << carga_atual << " kg / " << capacidade_maxima << " kg\n";
            cout << "Espaco Disponivel: " << capacidade_maxima - carga_atual << " kg\n";
        } 
        else if (opcao == 2) {
            float peso;
            cout << "Digite o peso do pacote a ser carregado (kg): ";
            cin >> peso;
            
            if (carga_atual + peso > capacidade_maxima) {
                cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada.\n";
            } else {
                carga_atual += peso;
                cout << "Pacote adicionado com sucesso!\n";
            }
        } 
        else if (opcao == 3) {
            float peso;
            cout << "Digite o peso do pacote a ser descarregado (kg): ";
            cin >> peso;
            
            if (peso > carga_atual) {
                cout << "Alerta: Nao e possivel remover mais peso do que a carga atual.\n";
            } else {
                carga_atual -= peso;
                cout << "Pacote removido com sucesso!\n";
            }
        } 
        else if (opcao == 4) {
            cout << "Encerrando sistema de telemetria...\n";
        }
    }
    
    return 0;
}