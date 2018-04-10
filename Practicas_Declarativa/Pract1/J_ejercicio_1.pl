% PRACTICA_1

% HECHOS 

hombre(isaac).
hombre(lot).
hombre(abraham).
hombre(haran).
hombre(teraj).
hombre(najor).
hombre(ismael).
hombre(isaac).
hombre(batuel).
hombre(esau).
hombre(jacob).
hombre(laban).

mujer(melca).
mujer(jesca).
mujer(sarai).
mujer(agar).
mujer(rebeca).

padre(abraham,isaac).
padre(abraham,ismael).
padre(haran,lot).
padre(haran,melca).
padre(haran,jesca).
padre(teraj,abraham).
padre(teraj,najor).
padre(teraj,haran).
padre(batuel,rebeca).
padre(batuel,laban).
padre(isaac,esau).
padre(isaac,jacob).

madre(agar,ismael).
madre(sarai,isaac).
madre(rebeca,esau).
madre(rebeca,jacob).

marido(abraham,sarai).
marido(najor,melca).
marido(isaac,rebeca).

esposa(sarai,abraham).
esposa(melca,najor).
esposa(rebeca,isaac).


%%% REGLAS

ascendiente_directo(X, Y) :- (padre(X, Y); madre(X, Y)).

ascendiente(X, Z) :- ascendiente_directo(X, Z).

ascendiente(X, Z) :- ascendiente_directo(X, Y), ascendiente(Y, Z).

hijo(X,Y) :- hombre(X), ascendiente_directo(Y,X).

hija(X,Y) :- mujer(X), ascendiente_directo(Y,X).

casados(X,Y) :- marido(X,Y) ; esposa(Y,X).

hermano(X,Z) :- hombre(X).
hermano(X,Z) :- padre(Y,X) , padre(Y,Z).
hermano(X,Z) :- madre(A,X) , madre(A,Z).


