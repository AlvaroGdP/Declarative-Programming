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


/*
a) Definir las relaciones: ascendiente de; descendiente de; abuelo(/a) de; hermano(/a) de; tío(/a) de; sobrino(/a) de; y primo(/a) de.


b) Definir un predicado que nos informe de las relaciones que hoy consideramos incestuosas.


c) Señalar las relaciones que sean directamente recursivas y las que sean indirectamente recursivas.*/

ascendiente_directo(X, Y) :- padre(X, Y); madre(X, Y).

ascendiente(X, Z) :- ascendiente_directo(X, Z).
ascendiente(X, Z) :- ascendiente_directo(X, Y), ascendiente(Y, Z).

hijo(X,Y) :- hombre(X), ascendiente_directo(Y,X).

hija(X,Y) :- mujer(X), ascendiente_directo(Y,X).

casados(X,Y) :- marido(X,Y) ; esposa(X,Y).

hermano(X,Z) :- hombre(X),(ascendiente_directo(Y,X)),(ascendiente_directo(Y,Z)).

hermana(X,Z):- mujer(X),(ascendiente_directo(Y,X)),(ascendiente_directo(Y,Z)).

tio(X,Z):- (hermano(X,Y), ascendiente_directo(Y,Z));(casados(X,Y),
                                                     ascendiente_directo(Y,Z)).

tia(X,Z):- (hermana(X,Y), ascendiente_directo(Y,Z));(casados(X,Y),
                                                     ascendiente_directo(Y,Z)).

sobrino(X,Y):- hombre(X),(tio(Y,X);tia(Y,X)).
sobrina(X,Y):- mujer(X), (tio(Y,X);tia(Y,X)).

primos(X,Z):- ((hijo(Y,Z);hija(Y,Z)),(tio(Y,X);tia(Y,X))).

% b)
incesto(X,Y):-(hombre(X),mujer(Y),casados(X,Y)),(ascendiente_directo(X,Y);
                                                hermano(X,Y);
                                                tio(X,Y);
                                                sobrino(X,Y);
                                                primos(X,Y)).
% c)

