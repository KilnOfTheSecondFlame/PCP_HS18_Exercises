mem(X, [X | _]).
mem(X, [_| Tail]) :- mem(X, Tail).

redCut(X, Y, Z, L) :- L = [_, _, _], mem(a, L),  mem(b, L), mem(c, L), !.
% Only one permutation
% L = [_, _, _], mem(a, L),  mem(b, L), mem(c, L), !.
% Es ist ein Red-Cut, da die deklarative Bedeutung des Praedikat veraendert wird
% D.h. weitere moegliche Loesungen werden abgeschnitten
