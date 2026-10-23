class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "Implemente o metodo interpretar na classe filha"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{@nome} tocando #{@instrumento} a peca '#{peca}': conduzindo a melodia principal."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{@nome} tocando #{@instrumento} a peca '#{peca}': acompanhando o ritmo do solista."
  end
end

class Regente
  attr_reader :nome

  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "Regente #{@nome} inicia a regencia da peca '#{peca}':"
    @orquestra.each do |inst|
      inst.interpretar(peca)
    end
  end

  def escalacao
    @orquestra.map do |inst|
      "Classe: #{inst.class} | Nome: #{inst.nome}"
    end
  end
end

solista = Solista.new("Kaori", "Violino")
acompanhador = Acompanhador.new("Kousei", "Piano")
regente = Regente.new("Hiroko")

regente.convocar(solista)
regente.convocar(acompanhador)

regente.reger("Sonata para Violino nº 9 de Beethoven")

regente.escalacao.each do |texto|
  puts texto
end
