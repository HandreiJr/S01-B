Dim peso As Single
Dim agua As Single   
Dim meta As Single

Input "Digite o seu peso: ", peso
Input "Digite a quantidade de agua: ", agua

meta = peso * 35

if agua >= meta Then
    Print"Meta atingida!"
else
    Print"Meta nao atingida"
End if
Sleep  