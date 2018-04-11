% esArbol(+O, +N),
%Se evalúa si el objeto O es un árbol de grado N.

esArbol(nil, _).
esArbol(hoja(C), _) :- integer(C).
esArbol(nodo(C, Hijos), N) :- integer(C), esListaNodos(Hijos, N), length(Hijos, N).

% esListaNodos(+L, +N)
% Recibe una lista L de nodos
% Se evalúa si todos los elementos de L son árboles de grado N.
esListaNodos([T], N) :- esArbol(T, N), !.
esListaNodos([H|T], N) :- esArbol(H, N), esListaNodos(T, N).

% peso(+A, -N)
% Recibe un árbol A
% devuelve el peso N del árbol A.
peso(nil, 0).
peso(hoja(C), 1) :- integer(C).
peso(nodo(C, Hijos), N) :- integer(C), pesoHijos(Hijos, N1), N is N1 + 1.

% peso(+A, -N)
% Recibe una lista de nodos L.
% devuelve el peso N de la lista de nodos L.
pesoHijos([T], N) :- peso(T, N), !.
pesoHijos([H|T], N) :- peso(H, N1), pesoHijos(T, N2), N is N1 + N2.

grado(nil, 0).
grado(hoja(C), 1) :- integer(C).
grado(nodo(C, Hijos), N) :- integer(C), gradoHijos(Hijos, N1), N is N1 + 1.

gradoHijos([T], N) :- grado(T, N), !.
gradoHijos([H|T], N) :- grado(H, N1), gradoHijos(T, N2), N is max(N1, N2).


frontera(nil, []).
frontera(hoja(C), [hoja(C)]) :- integer(C).
frontera(nodo(C, Hijos), L) :- integer(C), fronteraHijos(Hijos, L).

fronteraHijos([T], L) :- frontera(T, L), !.
fronteraHijos([H|T], L) :- frontera(H, L1), fronteraHijos(T, L2), append(L1, L2, L). 

preorden(nil, []).
preorden(hoja(C), [C]) :- integer(C).
preorden(nodo(C, Hijos), L) :- integer(C), preordenHijos(Hijos, L1), append([C], L1, L).

preordenHijos([T], L) :- preorden(T, L), !.
preordenHijos([H|T], L) :- preorden(H, L1), preordenHijos(T, L2), append(L1, L2, L).
