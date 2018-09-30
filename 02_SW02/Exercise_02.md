# PCP Übung zu Prolog 1 + 2

## Verwandschaftsbeziehungen

### a)
```pl
mother(X, jim).
father(X, jim).

mother(mary, X).
```

### c)
```pl
grandmother(X, jim).
X = mary ;
X = liz.
```

### d)
```pl
?- offspring(sue, X).
X = tina ;
X = tom ;
X = mary ;
X = mike ;
X = liz ;
X = jack ;
false.
```

## Kreuzworträtsel lösen
1st|2nd|3rd|4th|5th|6th| 
---|---|---|---|---|---|
-| L1 |-|-|-|-|
L2 | L3 | L4 | L5  |-|-|
-| L6 |-| L7  |-|-|
-| L8 | L9 | L10 | L11 | L12 |

```pl
?- crosswords(L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12).
L1 = g,
L2 = b,
L3 = r,
L4 = L7, L7 = o,
L5 = L10, L10 = t,
L6 = a,
L8 = u,
L9 = L12, L12 = n,
L11 = e .
```

1st|2nd|3rd|4th|5th|6th| 
---|---|---|---|---|---|
-| g |-|-|-|-|
b | r | o | t  |-|-|
-| a |-| o  |-|-|
-| u | n | t | e | n |


## Karte färben
```pl
?- consult('karteFaerben.pl').
true.

?- colors(LU, NW, OW, SZ, UR, ZG).
LU = UR, UR = yellow,
NW = ZG, ZG = green,
OW = SZ, SZ = red 
false.
```
Es existiert nur eine Lösung für diese Aufgabe.
