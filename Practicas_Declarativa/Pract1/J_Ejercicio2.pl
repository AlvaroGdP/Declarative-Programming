/**
Una base de datos puede representarse de forma natural en PROLOG como un conjunto de hechos. Por ejemplo, la información sobre una familia puede estructurarse como

familia(persona(antonio, foix, fecha(7, febrero, 1950), trabajo(renfe, 1200)),
persona(maria, lopez, fecha(17, enero, 1952), trabajo(sus_labores, 0)),
[persona(patricia, foix, fecha(10, junio, 1970), trabajo(estudiante, 0)),
persona(juan, foix, fecha(30, mayo, 1972), trabajo(estudiante,0))] ).

Podemos ver la anterior relación como una de las filas de una tabla que almacena las informaciones
de las familias. La tabla FAMILIA estaría compuesta por los campos: marido, esposa e hijos. Estos campos serían a su vez estructuras. Los campos marido y esposa son estructuras de tipo persona. El campo hijos está constituido por una lista de personas. Cada persona es una estructura de cuatro componentes: nombre, apellido, fecha de nacimiento y trabajo que desempeña.

Si representamos la información mediante estructuras, una propiedad agradable de PROLOG y su mecanismo de unificación es que podemos recuperar información de la base de datos mediante la formulación de objetivos en los que sus componentes no están completamente instanciados. Por ejemplo, el objetivo:

?- familia(P, M, H).

recupera la información sobre todas las familias en la base de datos y el objetivo
?- familia(P, M, H), P = persona(_, foix, _, _).

recupera la información sobre la familia Foix.

Ampliar la base de datos con los siguientes hechos:

familia( persona(manuel, monterde, fecha(15, marzo, 1934), trabajo(profesor, 2000)),
persona(pilar, gonzalez, fecha(9, julio, 1940), trabajo(maestra, 1900)),
[ persona(manolo, monterde, fecha(10, febrero, 1964), trabajo(arquitecto, 5000)),
persona(javier, monterde, fecha(24, noviembre, 1968), trabajo(estudiante, 0)) ] ).
familia( persona(jose, benitez, fecha(3, septiembre, 1958), trabajo(profesor, 2000)),
persona(aurora, carvajal, fecha(29, agosto, 1972), trabajo(maestra, 1900)),
[ persona(jorge, benitez, fecha(6, noviembre, 1997), trabajo(desocupado, 0))] ).
familia( persona(jacinto, gil, fecha(7, junio, 1958), trabajo(minero, 1850)),
persona(guillermina, diaz, fecha(12, enero, 1957), trabajo(sus_labores, 0)),
[ persona(carla, gil, fecha(1, agosto, 1958), trabajo(oficinista, 1500)),
persona(amalia, gil, fecha(6, abril, 1962), trabajo(deliniante, 1900)),
persona(irene, gil, fecha(3, mayo, 1970), trabajo(estudiante, 0)) ] ).
familia( persona(ismael, ortega, fecha(7, junio, 1966), trabajo(carpintero, 2350)),
persona(salvadora, diaz, fecha(12, enero, 1968), trabajo(sus_labores, 0)),
[] ).
familia( persona(pedro, ramirez, fecha(7, junio, 1966), trabajo(en_paro,0)),
persona(teresa, fuentes, fecha(12, enero, 1968), trabajo(administrativa, 1250)),
[] ).

y responder a las siguientes preguntas planteando objetivos:
a) encontrar los nombres y apellidos de las mujeres casadas que tienen tres o más hijos;
b) encontrar los nombres de las familias que no tienen hijos;
c) nombres de las familias en las que la mujer trabaja pero el marido no.
*/
% Hechos

familia(persona(antonio, foix, fecha(7, febrero, 1950), trabajo(renfe, 1200)),
persona(maria, lopez, fecha(17, enero, 1952), trabajo(sus_labores, 0)),
[persona(patricia, foix, fecha(10, junio, 1970), trabajo(estudiante, 0)),
persona(juan, foix, fecha(30, mayo, 1972), trabajo(estudiante,0))] ).

familia( persona(manuel, monterde, fecha(15, marzo, 1934), trabajo(profesor, 2000)),
persona(pilar, gonzalez, fecha(9, julio, 1940), trabajo(maestra, 1900)),
[ persona(manolo, monterde, fecha(10, febrero, 1964), trabajo(arquitecto, 5000)),
persona(javier, monterde, fecha(24, noviembre, 1968), trabajo(estudiante, 0)) ] ).

familia( persona(jose, benitez, fecha(3, septiembre, 1958), trabajo(profesor, 2000)),
persona(aurora, carvajal, fecha(29, agosto, 1972), trabajo(maestra, 1900)),
[ persona(jorge, benitez, fecha(6, noviembre, 1997), trabajo(desocupado, 0))] ).

familia( persona(jacinto, gil, fecha(7, junio, 1958), trabajo(minero, 1850)),
persona(guillermina, diaz, fecha(12, enero, 1957), trabajo(sus_labores, 0)),
[ persona(carla, gil, fecha(1, agosto, 1958), trabajo(oficinista, 1500)),
persona(amalia, gil, fecha(6, abril, 1962), trabajo(deliniante, 1900)),
persona(irene, gil, fecha(3, mayo, 1970), trabajo(estudiante, 0)) ] ).

familia( persona(ismael, ortega, fecha(7, junio, 1966), trabajo(carpintero, 2350)),
persona(salvadora, diaz, fecha(12, enero, 1968), trabajo(sus_labores, 0)),
[] ).

familia( persona(pedro, ramirez, fecha(7, junio, 1966), trabajo(en_paro,0)),
persona(teresa, fuentes, fecha(12, enero, 1968), trabajo(administrativa, 1250)),
[] ).

% familia(marido, esposa, [hijos]).
% persona(nombre,apellido,fecha_nacimiento,trabajo).
% trabajo(nombre,sueldo).
%

% a) nombre & apellidos de mujeres casados con 3+ hijos.
familia(_,persona(nombre,apellidos,_,_),[_,_,_,_|_]).

% b) nombres de las familias sin hijos
familia(persona(_,apellido,_,_),_,[]).

% c) nombre de las familias madre trabajadora & padre en paro
familia(persona(_,apellido,_,trabajo(en_paro,_)),
        persona(_,apellido,_,trabajo(_,_)),_).
