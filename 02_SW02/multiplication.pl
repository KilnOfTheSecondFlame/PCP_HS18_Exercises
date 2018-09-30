mult(1, X, X).
mult(_, 0, 0).
mult(X, 1, X).
mult(0, _, 0).
mult(M, N, X) :-
	M > 0,
	M1 is M - 1,
	mult(M1, N, X1),
	X is X1 + N.
	
