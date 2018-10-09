warn(T) :- T >= 100, write('Temperatur zu heiss').
warn(T) :- T > 80, T<100, write('Temperatur sehr warm').
warn(T) :- T =< 80, write('Temparatur ok').