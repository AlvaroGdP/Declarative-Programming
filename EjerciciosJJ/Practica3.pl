%partir(+L, -L1, -L2).
%Recibe una lista L.
%Devuelve dos listas L1 y L2 resultado de dividir L en dos listas
%Los elementos de L1 son menores o iguales que un cierto elemento de L
%Los elementos de L2 son mayores que dicho elemento
%El elemento no se incluye ni en L1 ni en L2
partir([], [], []).
partir([X|[]], [], []).
partir([X|T], L1, L2) :- p(X, T, L1, L2).

%p(+N, +L, -L1, -L2)
%Recibe un número N y una lista L
%Devuelve dos listas L1 y L2 resultado de dividir L en dos listas
%Los elementos de L1 son menores o iguales que N
%Los elementos de L2 son mayores que N
%N no se incluye ni en L1 ni en L2
p(N, [], [], []) :- !.
p(N, [X|T], [X|T1], T2) :- X =< N, !, p(N, T, T1, T2).
p(N, [X|T], T1, [X|T2]) :- X > N, !, p(N, T, T1, T2).

%quicksort(+Lista, -ListaOrdenada)
%Recibe una lista Lista.
%Devuelve otra lista ListaOrdenada resultado de ordenar Lista, ordenada por el método quicksort.

quicksort([], []).
quicksort([A|[]], [A|[]]) :- !.
quicksort([H|T], OL) :- partir([H|T], L1, L2), 
					quicksort(L1, OL1), quicksort(L2, OL2),
					append(OL1, [H|OL2], OL).

%mergesort(+Lista, -ListaOrdenada)
%recibe una lista%Recibe una lista Lista.
%Devuelve otra lista ListaOrdenada resultado de ordenar Lista, ordenada por el método mergesort.
mergesort([], []).
mergesort([T], [T]).
mergesort(L, OL) :-  append(L1, L2, L), length(L, X), length(L2, Y), Y is X//2,
				mergesort(L1, OL1), mergesort(L2, OL2),
				merge(OL1, OL2, OL).
				
				
%merge(+L1, +L2, -L)
%Recibe dos listas L1 y L2 ordenadas
%Devuelve una lista ordenada L resultado de combinar L1 y L2.
merge([], [], []).
merge(L, [], L) :- !.
merge([], L, L) :- !.				
merge([H1|T1], [H2|T2], [H1|T3]) :- H1 =< H2, !, merge(T1, [H2|T2], T3).
merge([H1|T1], [H2|T2], [H2|T3]) :- H1 > H2, !, merge([H1|T1], T2, T3).


%esMonomio(+X)
%Se evalúa si X es un monomio
esMonomio(x).
esMonomio(C) :- integer(C).
esMonomio(C * x) :- integer(C).
esMonomio(x ** N) :- integer(N).
esMonomio(C * x ** N) :- integer(C), integer(N).

%esPolinomio(X)
%Se evalúa si X es un polinomio
esPolinomio(X) :- esMonomio(X).
esPolinomio(X + Y) :- esPolinomio(X), esPolinomio(Y), !.

evalMonomio(x, V, R) :- R is V.
evalMonomio(C, V, R) :- integer(C), R is C.
evalMonomio(C * x, V, R) :- integer(C), R is C * V.
evalmonomio(x ** N, V, R) :- integer(N), R is V ** R.
evalMonomio(C * x ** N, V, R) :- integer(C), integer(N), R is C * V ** N.

%eval(+P, +V, -R)
%Recibe un polinomio P y un valor V
%Devuelve el valor R de calcular el polinomio P con el valor V
eval(P, V, R) :- esMonomio(P), !, evalMonomio(P, V, R).
eval(P + Q, V, R) :- eval(P, V, R1), eval(Q, V, R2), R is R1 + R2.

