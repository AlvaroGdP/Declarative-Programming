
%aplanar(+Lista, -ListaAplanada).
%Recibe una lista en la que los elementos pueden ser tambien listas
%Devuelve una lista con todos sus elementos como atomos
aplanar([], []).      
aplanar([H|T], [H|T1]) :- atomic(H), aplanar(T, T1).
aplanar([H|T], L) :- not(atomic(H)), aplanar(H, H1), aplanar(T, T1), append(H1, T1, L).

%sus(+X, +Y, +L1, -L2)
%Recibe dos elementos X y Y y una lista L1
%Devuelve una lista L2 con el elemento X sustituido por Y
sus(X, Y, [], []).
sus(X, Y, [X|T1], [Y|T2]) :- sus(X, Y, T1, T2).
sus(X, Y, [A|T1], [A|T2]) :- sus(X, Y, T1, T2).

%igualesElem(+L1, +L2)
%Recibe dos listas L1 y L2
%Devuelve TRUE si tienen el mismo numero de elementos independientemente de su orden y FALSE en otro caso
igualesElem([], []).
igualesElem(L1, L2) :- length(L1, N1), length(L2, N1),
						L1 = [X|T1], L2 = [Y|T2],
						el(X, T2, L22), el(Y, T1, L12),
						igualesElem(L12, L22).
								

%el(+X, +L1, -L2)
%Recibe un elemento X y una lista L1
%Devuelve una lista L2 sin el elemento X si lo tiene
el(X, [], []).
el(X, [X|T], T) :- !.
el(X, [Y|T], [Y|X2]) :- el(X, T, X2).
						
						
						
%descomponer(+N, -A, -B)
%Recibe u numero N
%Devuelve dos numeros pares A y B cuya suma es N1

descomponer(N, A, B) :- between(1, N, A), B is N - A,
						A mod 2 =:= 0,
						B mod 2 =:= 0,
						N is A + B.
						
%NumBrandreth(N, C)
%Devuelve un número N y su cuadrado C si N es un número de Brandreth.
numBrandreth(N, C) :- between(32, 99, N), C is N * N,
						X is C // 100, Y is C mod 100,
						N =:= X + Y.
						

						