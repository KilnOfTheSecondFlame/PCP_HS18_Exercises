% Uebung 3a
add_tail(X, [], [X]). % Falls Liste leer ist, dann ist nur Element in der Liste
add_tail(E, [Head | L1], [Head | L2]) :- add_tail(E, L1, L2). % Head am Ende der Liste L2 anhängen

% Uebung 3b
del([E | L1], E, L1). % Element aus dem Head loeschen
del([Head | L1], E, [Head | L2]) :- del(L1, E, L2). % Rekursiv durch liste gehen bis Element gefunden wurde

% Uebung 3c
mem_d(X, L) :- del(L, X, _). % Del ausfuehren. Nur true oder false interessiert uns

% Uebung 3d
rev_acc([], A, A). % Falls die Liste leer ist, dann Akkumulator als Result nehmen
rev_acc([X | L], A, Y) :- rev_acc(L, [X | A], Y). % Head Element nehmen und an Akkumulator haengen

% Uebeung 3e
rev(X, L) :- rev_acc(X, [], L).
