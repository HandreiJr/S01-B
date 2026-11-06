import java.util.HashMap;

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " apareceu levitando objetos e emitindo luzes prateadas!");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " se manifestou derrubando a temperatura do ambiente e sussurrando!");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println("O local '" + local + "' está tranquilo.");
        } else {
            System.out.print("Investigando " + local + ": ");
            ser.manifestar();
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Alienigena a1 = new Alienigena("Serppo");
        EspiritoYoukai e1 = new EspiritoYoukai("Turbo-Obaba");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Escola Abandonada", a1);
        mapa.registrar("Túnel da Montanha", e1);

        mapa.investigar("Escola Abandonada");
        mapa.investigar("Túnel da Montanha");
        mapa.investigar("Praça Central");
    }
}