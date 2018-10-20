# PCP Übung zu Scheme 1 + 2

## Aufgabe 1
Gliedern Sie folgende Terme im Editor und verfolgen Sie die Berechnung jedes Terms mit dem Stepper:
a) (42 + (25 - 3 * 4)) : 11
```racket
(/ (+ 42 (- 25 (* 3 4))) 11)
```
b) (24 + 32) : 7 + 3 * (17 - 15)
```racket
(+ (/ (+ 24 32) 7) (* 3 (- 17 25)))
```
c) 34428 : 38 - (1103 - 197)
```racket
(- (/ 34428 38) (- 1103 197))
```

## Aufgabe 2

### a)
```racket
(/ 1 (+ 1 1))
```
1 : (1 + 1)
### b)
```racket
(/ 1 (+ 1 (/ 1 (+ 1 1))))
```
1 : (1 + 1 : (1 + 1))
### c)
```racket
(/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 1))))))
```
1 : (1 + (1 : (1 + 1 : (1 + 1))))
Dezimal Zahlen werden ziemlich genau dargestellt (Mit dem unendlich Zeichen)

## Aufgabe 4

b) Indem man die Gleichung folgendermassen vereinfacht:
```racket
(* (- 0 30) (- (+ a b) c))
```
-30(a+b-c)

## Aufgabe 5

Darf man bei folgenden Beispielen die (cond ...)-Klauseln vertauschen ohne dass sich die Semantik
des Programms ändert?

### a) Temperaturen
```racket
(cond
	((> temperatur 35) "heiss")
	((> temperatur 25) "warm")
	((> temperatur 15) "mittel")
	(else "kalt"))
```
Nein, das Programm würde dann jeweils "mittel" ausgeben und nie zu "heiss" kommen.

### b) Teilbar
```racket
(cond
	((zero? (remainder zahl 2)) "durch 2 teilbar")
	((zero? (remainder zahl 3)) "durch 3 teilbar")
	(else "weder durch 2 noch durch 3 teilbar"))
```
Nein, Multiple von 6 würden dann jeweils angeben, dass Sie durch 3 teilbar sind anstelle von 2.