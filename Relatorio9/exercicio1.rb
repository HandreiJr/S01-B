class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end

  def ficha
    "Drink: #{@nome} - Preço: R$ #{@_preco}"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    "#{super} | Homenageia a lenda: #{@lenda}"
  end
end

drinks = [
  CoquetelAfterlife.new("Vodka Tonica", 25),
  DrinkDeLenda.new("Silverhand", 120, "Johnny Silverhand"),
  DrinkDeLenda.new("Jackie Welles", 90, "Jackie Welles")
]

drinks.each do |drink|
  puts drink.ficha
end

drink_especial = drinks[1]
drink_especial.preco = 500
drink_especial.preco = 80
puts drink_especial.ficha
