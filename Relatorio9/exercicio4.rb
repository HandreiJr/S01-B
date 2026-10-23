module Depoente
  def depor
    raise NotImplementedError, "Metodo depor deve ser implementado"
  end
end

module Detivel
  def ser_detido
    puts "#{@nome} foi levado pela Scotland Yard."
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{@nome} (Testemunha): Vi alguém suspeito correndo em direção ao beco escuro as 22h."
  end
end

class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  def initialize(nome, alibi)
    super(nome)
    @alibi = alibi
  end

  def depor
    puts "#{@nome} (Suspeito): Meu alibi é que eu estava jogando xadrez no clube o tempo todo."
  end
end

class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "Investigacao do caso: #{@caso}"
    @envolvidos.each do |envolvido|
      envolvido.depor
    end
  end

  def acionar_scotland_yard
    puts "\nAvaliando detencoes para o caso #{@caso}:"
    suspeitos_detiveis = @envolvidos.select { |e| e.respond_to?(:ser_detido) }
    suspeitos_detiveis.each do |suspeito|
      suspeito.ser_detido
    end
  end
end

testemunha = TestemunhaOcular.new("Sra. Hudson")
suspeito1 = SuspeitoDoCrime.new("John Mears", "Estava no pub")
suspeito2 = SuspeitoDoCrime.new("Irene Adler", "Estava viajando")

investigacao = Investigacao.new("O Roubo na Baker Street")

investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard