using System;

public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public int Circulo { get; private set; }
    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto, int circulo)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
        this.Circulo = circulo;

        Console.WriteLine($"[Convocacao] {Nome} de {Povo} foi convocado para o {Circulo}º Circulo de Minas Tirith!");
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"\n--- Ficha do Combatente ---");
        Console.WriteLine($"Nome: {Nome}");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");
        Console.WriteLine($"Circulo: {Circulo}");

        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Cerco a Minas Tirith ===");

        CombatenteDeGondor legolas = new CombatenteDeGondor("Legolas", "Elfo", "Arqueiro", 1);
        legolas.Equipar("Arco dos Galadhrim");

        CombatenteDeGondor pippin = new CombatenteDeGondor("Peregrin Took", "Hobbit", "Guarda da Cidadela", 7);

        CombatenteDeGondor boromir = new CombatenteDeGondor("Boromir", "Homem", "Capitao de Gondor", 1);
        boromir.Equipar("Espada de Gondor");

        legolas.ApresentarUnidade();
        pippin.ApresentarUnidade();
        boromir.ApresentarUnidade();
    }
}