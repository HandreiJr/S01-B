Dim pin AS INTEGER
Dim pinDigitado AS INTEGER

pin = 4321

Input "Digite o PIN de acesso: ", pinDigitado

while pinDigitado <> pin
    Print "PIN invalido. Tente novamente."
    INPUT "Digite o PIN de acesso: ", pinDigitado
wend    

Print"Transacao autorizada!"
SLEEP