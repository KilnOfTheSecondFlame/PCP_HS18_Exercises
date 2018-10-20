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

## Aufgabe 3
```racket
(define (diagonal a b) (sqrt (+ (sqr a) (sqr b))))
(diagonal 10 4)
```

## Aufgabe 4

b) Indem man die Gleichung folgendermassen vereinfacht:
```racket
(* (- 0 30) (- (+ a b) c))
```
-30(a+b-c)

## Aufgabe 5 *

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

## Aufgabe 6 *
Analysieren Sie die folgende Funktion zur Maut Berechnung
```racket
(define (toll total-weight)
	(cond
		((not (number? total-weight)) "Eingabe muss Zahl sein!")
		((<= total-weight 0) "Zahl muss größer 0 sein!")
		((<= total-weight 1000) 20)
		((<= total-weight 2000) 30)
		((<= total-weight 5000) 50)
		((<= total-weight 10000) 100)
		(else 250)))
```

### a) Welchen Sinn haben die beiden ersten Klauseln?
Sie prüfen die Attribute auf richtigen Typ und positiven Wert.

### b) Begründen Sie, weshalb man hier die Reihenfolge der Klauseln nicht ändern darf
Da das Programm ansonsten einen Fehler ausgibt (weil es bspw. einen String auf Grösse vergleicht)

### c) Nennen Sie ein konkretes Beispiel, bei dem man die Klauseln ändern darf
```racket
(define (rand string)
	(cond
		((eq? string "a") "b")
		((eq? string "b") "c")
		(else "a")
		)
	)
```
## Aufgabe 7 *

Gegeben ist
```racket
(* (cond ((> a b) a)
	((< a b) b)
	(else -1))
	(+ a 1))
```
### a) Handelt es sich um einen korrekten Scheme-Ausdruck? Begründung!
Nein, da a und b nicht definiert sind, und somit a>b fehlschlägt
### b) Definieren Sie a und b jeweils so, dass alle Klauseln einmal zutreffen. Welche Ergebnisse erhalten Sie?
```racket
(define (task7 a b)
	(* (cond ((> a b) a)
		((< a b) b)
		(else -1))
		(+ a 1))
)
```
```racket
> (task7 1 2)
4
> (task7 2 1)
6
```

## Aufgabe 8
```racket
(define-struct punkt (x y))
(define (abstand p) 
	(sqrt (+ (sqr (punkt-x p)) (sqr (punkt-y p))))
)
(define p (make-punkt 3 4))
(abstand p)
```

## Aufgabe 9
Bei Skelettfunden schließt man aus der Länge der Knochen auf die Körpergrösse; und zwar gilt (als
statistischer Mittelwert) in cm:

. $Körpergrösse = 69.089 + 2.238 \cdot\ Oberschenkelknochenlänge\ bei\ Männern$
. $Körpergrösse = 61.412 + 2.317 \cdot\ Oberschenkelknochenlänge\ bei\ Frauen$

Ab dem 30. Lebensjahr nimmt die Körpergröße um 0,06 cm pro Jahr ab.
### a) Definieren Sie einen Datentyp human mit den Feldern Alter, Geschlecht und Oberschenkelknochenlänge.
```racket
(define-struct human (alter geschlecht obklaenge))
```
### b) Erstellen Sie eine Funktion b-length, die aus einem Objekt vom Typ human die vermutete Körpergrösse berechnet.
```racket
(define-struct human (alter geschlecht obklaenge))
(define (b-length mensch)
	(if (human? mensch) 
		(cond
			(
				(eq? "mann" (human-geschlecht mensch))
				(- 
					(+ 69.089 (* 2.238 (human-obklaenge mensch)))
					(cond 
						((<= 30 (human-alter mensch)) (* 0.06 (- 30 (human-alter mensch))))
						(else 0)
					)
				)
			)
			(
				(eq? "frau" (human-geschlecht mensch))
				(- 
					(+ 61.412 (* 2.317 (human-obklaenge mensch)))
					(cond 
						((<= 30 (human-alter mensch)) (* 0.06 (- 30 (human-alter mensch))))
						(else 0)
					)
				)
			)
			(else "Unbekanntes Geschlecht")
		)
		"Please provide a <human> attribute"
	)
)
```
```racket
(define bert (make-human 42 "mann" 50))
(define anna (make-human 42 "frau" 43))
(b-length bert)
(b-length anna)
```