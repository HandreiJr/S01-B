mestre(sasuke, boruto).
mestre(naruto, boruto).

aprendiz_de_elite(Ninja) :-
    (mestre(kakashi, Ninja); mestre(sasuke, Ninja)),
    (natureza(Ninja, raio); natureza(Ninja, fogo)).

?- aprendiz_de_elite(Ninja).

ninja_versatil(Ninja) :-
    vila(Ninja, konoha),
    natureza(Ninja, X),
    natureza(Ninja, Y),
    X \= Y.

?- ninja_versatil(Ninja).

rivais(A, B) :-
    mestre(M, A),
    mestre(M, B),
    A \= B,
    cla(A, C1),
    cla(B, C2),
    C1 \= C2.

?- rivais(naruto, Rival).

linhagem(M, D) :-
    mestre(M, D).
linhagem(M, D) :-
    mestre(M, Z),
    linhagem(Z, D).

?- linhagem(jiraiya, Discipulo).
```[cite: 18, 19, 20, 21, 23]