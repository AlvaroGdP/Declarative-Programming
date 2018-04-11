%%EJERCICIO 1 
%%A- APLANAR LISTA
aplanar([],[]).
aplanar([[]|T],T1):- aplanar(T,T1).
aplanar([[H|T]|R],T1):- !,aplanar([H|T],S), aplanar(R,S1), append(S,S1,T1).
aplanar([H|T],[H|T1]):-aplanar(T,T1).

%%B- MAXIMO DE UNA LISTA
maxList(L,Max):- maxAcum(L,0,Max).

maxAcum([],Max,Max).
maxAcum([H|T],Act,Max):- (H>Act,!, maxAcum(T,H,Max));maxAcum(T,Act,Max).

%%C- Union de conjuntos
union(C1,C2,U):- quitarepes(C1,C2,C1R), append(C1R,C2,U).

quitarepes([],C2,[]).
quitarepes([H|T],C2,L):-member(H,C2),!,quitarepes(T,C2,L).
quitarepes([H|T],C2,[H|L]):-not(member(H,C2)),!,quitarepes(T,C2,L).

%%EJERCICIO 2
%%A- INTRODUCIR OPERADOR
:-op(990,xfy,:=).
%%DEFINIR UN APLICAR ENLACE Y UN APLICAR SUSTITUCION
aplicaEnlace(T1:=T2,T1,T2):- !.
aplicaEnlace(_:=_,T1,T1):- atomic(T1),!.
aplicaEnlace(V:=T,T1,T2):- T1=..[F|Term], sustituirLista(V:=T,Term,Term1), T2=..[F|Term1],!.

sustituirLista(_,[],[]).
sustituirLista(V:=T,[T1|T1s],[T2|T2s]):- aplicaEnlace(V:=T,T1,T2), sustituirLista(V:=T,T1s,T2s).

aplicaSub([],T1,T1).
aplicaSub([V:=T|H],T1,T2):-aplicaEnlace(V:=T, T1,T1s), aplicaSub(H,T1s,T2).