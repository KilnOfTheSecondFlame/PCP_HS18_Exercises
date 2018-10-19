# PCP Übung zu Scheme 1 + 2

## Aufgabe 1
Gliedern Sie folgende Terme im Editor und verfolgen Sie die Berechnung jedes Terms mit dem Stepper:
a) (42 + (25 - 3 * 4)) : 11
```prolog
(/ (+ 42 (- 25 (* 3 4))) 11)
```
b) (24 + 32) : 7 + 3 * (17 - 15)
```prolog
(+ (/ (+ 24 32) 7) (* 3 (- 17 25)))
```
c) 34428 : 38 - (1103 - 197)
```prolog
(- (/ 34428 38) (- 1103 197))
```

## Aufgabe 2

### a)
```prolog
(/ 1 (+ 1 1))
```
1 : (1 + 1)
### b)
```prolog
(/ 1 (+ 1 (/ 1 (+ 1 1))))
```
1 : (1 + 1 : (1 + 1))
### c)
```prolog
(/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 1))))))
```
1 : (1 + (1 : (1 + 1 : (1 + 1))))
Dezimal Zahlen werden ziemlich genau dargestellt (Mit dem unendlich Zeichen)
