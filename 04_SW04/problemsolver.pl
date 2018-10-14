% Problem solver
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).

% Load solver files
:- consult(sudoku).
:- consult(verwandschaft).

% Solve relationship
solve(relationship, N) :-
	% Concat URL with problemKey
	atom_concat('http://localhost:16316/problem/relationship/', N, URL),
	http_get(URL, json(Reply), []),
	% Assign relevant JSON-attributes  to variables
	member('relationship'=Relationship, Reply),
	member('firstPerson'=FirstPerson, Reply),
	member('secondPerson'=SecondPerson, Reply),
	% Call solver predicat
	solve_relationship(N, Relationship, FirstPerson, SecondPerson).

% Solve Sudoku
solve(sudoku, N) :-
	% Concat URL with problemKey
	atom_concat('http://localhost:16316/problem/sudoku/', N, URL),
	http_get(URL, json(Reply), []),
	% Assigne relevant attribute to variable
	member('sudoku'=Raw_Sudoku, Reply),
	% Replace 0 with _ => Calls recursive
	replace_0(Raw_Sudoku, Sudoku),
	% Solve Sudoku
	Sudoku = [A,B,C,D,E,F,G,H,I],
	sudoku([A,B,C,D,E,F,G,H,I]),
	http_post('http://localhost:16316/problem/sudoku', json(json([problemKey=N,solution=Sudoku])), _, []).

% if relationship solver return true as response, then send true to server and cut
solve_relationship(N, Relationship, FirstPerson, SecondPerson) :-
	call(Relationship,FirstPerson, SecondPerson),
	http_post('http://localhost:16316/problem/relationship', json(json([problemKey=N, solution=true])), _, []),
	!.

% Only if relationship solver returns false as reponse, send hardcoded false to server
solve_relationship(N, Relationship, FirstPerson, SecondPerson) :-
	\+ call(Relationship, FirstPerson, SecondPerson),
	http_post('http://localhost:16316/problem/relationship', json(json([problemKey=N,solution=false])), _, []),
	!.

% Simple case: Replace 0 with _
replace_0(0, _).
% Call recursive, till simple case
replace_0(Input, Output) :-
	is_list(Input), % Only call recursive, if element is a list!
	maplist(replace_0, Input, Output), % Call recursive and then red cut
	!.
% Simple case, do not replace character
replace_0(X, X).
