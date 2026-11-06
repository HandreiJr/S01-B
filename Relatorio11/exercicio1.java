import java.util.ArrayList;

abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("Eu sou o mago " + getNome() + " e meu feitiço é " + feitico + ".");
    }
}

class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Eu sou " + getNome() + " e eu faço o castelo andar!");
    }
}

public class Main {
    public static void main(String[] args) {
        Morador m1 = new Mago("Howl", "Transformação");
        Morador m2 = new DemonioDoFogo("Calcifer");

        m1.apresentar();
        m2.apresentar();

    }
}