%%EJERCICIO 1
%%INTERSEC
intersec([],C2,[]).
intersec([H|T],C2,[H|L]):-member(H,C2),!, intersec(T,C2,L).
intersec([H|T],C2,L):-not(member(H,C2)),!,intersec(T,C2,L).
%%Ifelse
ifThenElse(C,A1,A2):-(call(C),!,call(A1));call(A2).
%%EJERCICIO 2 HANOI
hanoi(N,L):- hanoi1(N,'izquierda','apoyo','derecha',[],L).

hanoi1(0,_,_,_,L,L):-!.
hanoi1(N,From,Apoyo,To,H,H1):- N1 is N-1, hanoi1(N1,From,To,Apoyo,H,Hs), escribir(From,To,Hs,Hd),hanoi1(N1,Apoyo,From,To,Hd,H1).

escribir(From,To,L,L1):-append(L,['mover','disco','desde',From,'a',To],L1), write_ln(['mover','disco','desde',From,'a',To]).