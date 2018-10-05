fib_tr(N, F) :- fib_tr(N, 0, 1, F).
fib_tr(0, A, _, A).
fib_tr(N, A, B, F) :-
	N1 is N - 1,
	N1 >= 0,
	Sum is A + B,
	fib_tr(N1, B, Sum, F).

fib_io() :- 
	write("Bitte geben Sie eine Zahl ein: "),
	read(X),
	fib_tr(X, Y),
	write("Die "), write(X), write(". te Fibonacci Zahl ist: "),write(Y).