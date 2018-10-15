:- use_module(library(clpr)).
:- use_module(library(clpfd)).

% Analog zu den Folien
numbers_riddle([D,O,N,A,L,D] + [G,E,R,A,L,D] = [R,O,B,E,R,T]) :-
	Variablen = [A, B, D, E, G, L, N, O, R, T],
	Variablen ins 0..9,								% Domäne für die Variablen
	all_distinct(Variablen),						% Alle Variablen müssen einen unterschiedlichen Wert haben
	100000*D + 10000*O + 1000*N + 100*A + 10*L + D +
	100000*G + 10000*E + 1000*R + 100*A + 10*L + D #=
	100000*R + 10000*O + 1000*B + 100*E + 10*R + T,
	D #\= 0, G #\= 0, R #\= 0, 						% Zahlen dürfen nicht mit 0 anfangen
	label(Variablen).