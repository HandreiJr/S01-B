package main

import "fmt"

func main() {
	var t1, t2, t3 int

	fmt.Print("Digite as vendas do 1o trimestre: ")
	fmt.Scan(&t1)
	fmt.Print("Digite as vendas do 2o trimestre: ")
	fmt.Scan(&t2)
	fmt.Print("Digite as vendas do 3o trimestre: ")
	fmt.Scan(&t3)

	total := t1 + t2 + t3
	fmt.Printf("Total de vendas: %d unidades\n", total)

	if total < 100 {
		fmt.Println("Meta minima anual nao atingida!")
	} else {
		switch {
		case total >= 250:
			fmt.Println("Classificacao: Categoria Top Seller")
		case total >= 180 && total <= 249:
			fmt.Println("Classificacao: Categoria Senior")
		case total >= 100 && total <= 179:
			fmt.Println("Classificacao: Categoria Pleno")
		}
	}
}