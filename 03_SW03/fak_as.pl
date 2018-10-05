fak_tr(N, F) :- fak_tr(N, 1, F).
fak_tr(0, A, A).
fak_tr(N, Mult, F) :-
	N1 is N - 1,
	N1 >= 0,
	Mult1 is N * Mult,
	fak_tr(N1, Mult1, F).

fak(N, F) :- fak_as(N, F), ! , write("Hinweis: Fakultaet "), write(N), write(" war gespeichert").

:- dynamic fak_as/2.

fak_as(0, 1).
fak_as(N, F):-
	N >= 0,
	N1 is N-1,
	fak_as(N1, F1),
	F is N*F1,
	asserta(fak_as(N, F)).