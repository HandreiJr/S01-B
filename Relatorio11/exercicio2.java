import java.util.ArrayList;

class ItemDoCardapio {
    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}

class ComboLeblanc extends ItemDoCardapio {
    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}

class CafeLeblanc {
    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        this.cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        for (ItemDoCardapio item : cardapio) {
            System.out.println("Item: " + item.getNome() + " | Preço: R$ " + item.precoFinal());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        ItemDoCardapio i1 = new ItemDoCardapio("Café Coado", 8.0);
        ItemDoCardapio i2 = new ItemDoCardapio("Curry da Casa", 25.0);
        ComboLeblanc c1 = new ComboLeblanc("Combo Especial Leblanc", 30.0);

        CafeLeblanc cafe = new CafeLeblanc();
        cafe.adicionar(i1);
        cafe.adicionar(i2);
        cafe.adicionar(c1);

        cafe.mostrarCardapio();
    }
}