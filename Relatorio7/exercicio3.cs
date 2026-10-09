using System;
using System.Collections.Generic;

public class Feitico
{
    public string Nome { get; set; }

    public Feitico(string nome)
    {
        this.Nome = nome;
    }

    public void Conjurar()
    {
        Console.WriteLine($"Conjurando a magia: {Nome}!");
    }
}

public class Grimorio
{
    private List<Feitico> _feiticos;

    public Grimorio()
    {
        this._feiticos = new List<Feitico>();
    }

    public void Registrar(string nomeFeitico)
    {
        Feitico novoFeitico = new Feitico(nomeFeitico);
        this._feiticos.Add(novoFeitico);
        Console.WriteLine($"Magia '{nomeFeitico}' anotada no grimorio.");
    }

    public void ListarFeiticos()
    {
        Console.WriteLine($"\n=== Grimorio ({_feiticos.Count} feitico(s) registrado(s)) ===");
        foreach (var feitico in _feiticos)
        {
            feitico.Conjurar();
        }
    }
}

public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    public Companheiro(string nome, string funcao)
    {
        this.Nome = nome;
        this.Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine($"Companheiro: {Nome} | Funcao: {Funcao}");
    }
}

public class Maga
{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; private set; }
    private List<Companheiro> _companheiros;

    public Maga(string nome)
    {
        this.Nome = nome;
        this.Grimorio = new Grimorio();
        this._companheiros = new List<Companheiro>();
    }

    public void RecrutarCompanheiro(Companheiro c)
    {
        this._companheiros.Add(c);
        Console.WriteLine($"{c.Nome} agora acompanha {Nome}.");
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\n=== Grupo de {Nome} ({_companheiros.Count} integrante(s)) ===");
        foreach (var comp in _companheiros)
        {
            comp.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Jornada de Frieren ===");

        Companheiro fern = new Companheiro("Fern", "Maga Aprendiz");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.RecrutarCompanheiro(fern);
        frieren.RecrutarCompanheiro(stark);

        frieren.Grimorio.Registrar("Feitico de Fazer Florescer Orelhas de Bode");
        frieren.Grimorio.Registrar("Zoltraak (Magia de Ataque)");
        frieren.Grimorio.Registrar("Feitico de Limpar Estatuas");

        frieren.MostrarGrupo();
        frieren.Grimorio.ListarFeiticos();

        Console.WriteLine("\n--- Apresentacao Direta ---");
        stark.Apresentar();
    }
}