using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Especie { get; private set; }
    public int Nivel { get; private set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void EntrarEmCampo()
    {
        Console.WriteLine($"\n[Pokemon Generico] {Especie} (Nv. {Nivel}) entrou em campo!");
        Console.WriteLine($"{Especie} usou Investida!");
    }
}

public class TipoPlanta : Pokemon
{
    public string GolpeEspecial { get; set; }

    public TipoPlanta(string especie, int nivel, string golpeEspecial) : base(especie, nivel)
    {
        this.GolpeEspecial = golpeEspecial;
    }

    public override void EntrarEmCampo()
    {
        Console.WriteLine($"\n[Tipo Planta] {Especie} (Nv. {Nivel}) surge em meio a folhas!");
        Console.WriteLine($"{Especie} executou o golpe especial: {GolpeEspecial}!");
    }
}

public class TipoEletrico : Pokemon
{
    public int Voltagem { get; private set; }

    public TipoEletrico(string especie, int nivel, int voltagem) : base(especie, nivel)
    {
        this.Voltagem = voltagem;
    }

    public override void EntrarEmCampo()
    {
        base.EntrarEmCampo();
        Console.WriteLine($"Uma tempestade eletrica se forma ao redor! Voltagem: {Voltagem}V!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Batalha de Exibicao Pokemon ===");

        List<Pokemon> campoDeBatalha = new List<Pokemon>();

        campoDeBatalha.Add(new TipoPlanta("Sceptile", 52, "Lamina de Folha"));
        campoDeBatalha.Add(new TipoEletrico("Jolteon", 48, 12000));
        campoDeBatalha.Add(new Pokemon("Eevee", 15));

        Console.WriteLine($"\nPokemon em campo: {campoDeBatalha.Count}");

        foreach (var pokemon in campoDeBatalha)
        {
            pokemon.EntrarEmCampo();
        }
    }
}