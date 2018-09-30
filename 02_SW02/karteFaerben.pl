% Possible pairs of colors neighboring countries
n(yellow, red).		n(red, yellow).
n(yellow, green).	n(red, green).
n(green, red).		n(green, yellow).

% Part of Switzerland
colors(LU, NW, OW, SZ, UR, ZG) :-
	UR = yellow,					% UR must be yellow
	SZ = red, 					% Schwyz must be red
	n(LU, ZG), n(LU, SZ), n(LU, NW), n(LU, OW),	% Neighbors of LU
	n(ZG, SZ), n(ZG, LU),				% Neighbours of ZG
	n(SZ, ZG), n(SZ, LU), n(SZ, NW), n(SZ, UR),	% Neighbours of SZ
	n(NW, LU), n(NW, SZ), n(NW, OW), n(NW, UR),	% Neighbours of NW
	n(OW, LU), n(OW, NW), n(OW, UR),		% Neighbours of OW
	n(UR, SZ), n(UR, NW), n(UR, OW).		% Neighbours of UR
