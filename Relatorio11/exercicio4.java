import java.util.ArrayList;

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Cozinhar em fogo baixo até virar uma geleia consistente e temperar com ervas.";
    }
}

class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Descascar as raízes, cortar em rodelas e refogar com alho e manteiga.";
    }
}

class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("Cozinheiro: " + nome + " | Panela de: " + panela.getMaterial());
        for (Monstro m : ingredientes) {
            System.out.println("Ingrediente: " + m.getNome() + " -> Receita: " + m.receita());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Slime slime = new Slime("Slime Gigante");
        Mandragora mandragora = new Mandragora("Mandragora Gritadeira");

        Cozinheiro cozinheiro = new Cozinheiro("Senshi", "Ferro Fundido");
        cozinheiro.adicionarIngrediente(slime);
        cozinheiro.adicionarIngrediente(mandragora);

        cozinheiro.servirBanquete();
    }
}