% Rekursionsbasis: Falls Set1 Leer ist, gibt es keine Elemente in ResultSet
set_difference([], _, []).

% "Entferne" alle Elemente E aus dem Set1 die im Set2 enthalten sind
set_difference([E | Set1], Set2, ResultSet) :-
 	member(E, Set2),
 	set_difference(Set1, Set2, ResultSet).

% Alle Elemente E von Set1 die in Set2 nicht enthalten sind füge zu ResultSet hinzu
set_difference([E | Set1], Set2, [E | ResultSet]) :-
	\+ member(E, Set2),
	set_difference(Set1, Set2, ResultSet).

% Prolog Befehle
% [set_difference].
% set_difference([a, b, c, d], [], L).
% set_difference([a, b, c, d], [b, d, e, f], [a, c]).
% set_difference([1, 2, 3, 4, 5, 6], [2, 4, 6], L).