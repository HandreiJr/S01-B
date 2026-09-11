package main

import "fmt"

func ValidarCodigoRastreio(codigo string) (bool, string) {
	if len(codigo) == 10 {
		return true, "Codigo de rastreio registrado no sistema!"
	}
	return false, "Erro: O codigo de rastreio deve ter exatamente 10 caracteres."
}

func main() {
	var codigo string

	for {
		fmt.Print("Digite o codigo de rastreio: ")
		fmt.Scan(&codigo)

		valido, mensagem := ValidarCodigoRastreio(codigo)
		
		if valido {
			fmt.Println(mensagem)
			break
		} else {
			fmt.Println(mensagem)
		}
	}
}