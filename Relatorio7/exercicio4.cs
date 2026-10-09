using System;
using System.Collections.Generic;

public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
        Console.WriteLine($"[Arquivo Miskatonic] Registro criado para a entidade '{Nome}'.");
    }

    public virtual void Manifestar()
    {
        Console.WriteLine($"\n--- Entidade Cósmica: {Nome} ---");
        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
        Console.WriteLine("Sensacao de perturbacao no espaço ao redor...");
    }
}

public class Profundo : EntidadeCosmica
{
    public int Profundidade { get; private set; }

    public Profundo(string nome, int profundidade) : base(nome)
    {
        this.Profundidade = profundidade;
    }

    public override void Manifestar()
    {
        Console.WriteLine($"\n--- Profundo: {Nome} ---");
        Console.WriteLine($"Habitante das fossas abissais ({Profundidade} metros de profundidade). O cheiro de agua salgada toma o local.");
    }
}

public class MiGo : EntidadeCosmica
{
    public string Artefato { get; set; }

    public MiGo(string nome, string artefato) : base(nome)
    {
        this.Artefato = artefato;
    }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"A entidade fungoide porta o artefato: {Artefato}. Ruidos zumbidores perturbam a mente!");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }
    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\n=== Lendo Arquivos de {Nome} ({_catalogo.Count} Entidades Catalogadas) ===");
        foreach (var entidade in _catalogo)
        {
            entidade.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Arquivos Proibidos da Universidade Miskatonic ===");

        Profundo profundo = new Profundo("Profundo de Innsmouth", 1500);

        MiGo migo = new MiGo("Fungoide Extraterrestre", "Cilindro de Cerebro");
        migo.Origem = "Yuggoth";

        EntidadeCosmica generica = new EntidadeCosmica("A Cor que Caiu do Espaço");

        Pesquisador armitage = new Pesquisador("Henry Armitage");

        armitage.Catalogar(profundo);
        armitage.Catalogar(migo);
        armitage.Catalogar(generica);

        armitage.LerCatalogo();
    }
}