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
.---+---+---+---+---+---.
|   | L1 |   |   |   |   |
+---+---+---+---+---+---+
| L2 | L3 | L4 | L5 |   |   |
+---+---+---+---+---+---+
|   | L6 |   |   | L7 |   |
+---+---+---+---+---+---+
|   | L8 | L9 | L10 | L11 | L12 |
.---+---+---+---+---+---.