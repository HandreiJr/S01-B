class PhoneWave
  def enviar_dmail(mensagem)
    puts "Mensagem enviada: '#{mensagem}' -> Enviada para o passado com sucesso!"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero} - #{membro.nome} admitido no laboratorio."
  end

  def experimento(mensagem)
    @membros.each do |membro|
      puts "Lab Mem #{membro.numero}: #{membro.nome} participando do experimento."
    end
    @phonewave.enviar_dmail(mensagem)
  end
end

membro1 = MembroDoLab.new(1, "Rintaro Okabe")
membro2 = MembroDoLab.new(2, "Mayuri Shiina")

lab = LaboratorioDeGadgets.new
lab.admitir(membro1)
lab.admitir(membro2)

lab.experimento("Atenção CERN, alteração na linha temporal detectada.")