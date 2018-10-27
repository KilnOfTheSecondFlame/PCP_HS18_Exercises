# Scheme 3 + 4

## 1. Aufgabe

Folgende Definitionen liegen vor:
```racket
(define couple (list
	(cons "Adam" (cons "Eva" empty))
	(cons "Paul" (cons "Paula" empty))))
(define spec-list (list 1 (list 2 3 (list 5 7) 9)))
```

### a) Welche Ergebnisse bringen folgende Funktionsaufrufe?

```racket
(rest (first couple))
> (list "Eva")
(first (rest couple))
> (list "Paul" "Paula")
(rest (rest couple))
> '()
> (empty? (rest (rest couple)))
#true
(first (first (rest couple)))
> "Paul"
(rest (first (rest couple)))
> (list "Paula")
(cons? (rest (rest couple)))
> #false
(list? (rest (rest couple)))
> #true
```

### b) Gibt es eine Kombination von `first` und `rest` an, mit der man den Wert 7 aus der `spec-list` herausfiltern kann?

Ja und zwar `(first (rest (first (rest (rest (first (rest spec-list)))))))`

## 2. Aufgabe
Verallgemeinern Sie die Funktion `redoubler` (Folie Beispiel: Listen-Elemente verdoppeln) so, dass jedes Element einer Zahlen-Liste mit einem beliebigen Faktor multipliziert wird.
```racket
(define (remultiply a-list n)
	(cond (
		(empty? a-list) empty)
		(else
			(cond (
				(number? n) (cons (* n (first a-list)) (redouble (rest a-list) n))
				)
			)
		)
	)
)
(remultiply (list 3 2 1) 3)
```

## 3. Aufgabe *

Untersuchen Sie die folgenden Funktionen. Was bewirken diese Funktionen?

### a)
```racket
(define (f liste)
	(if (empty? liste)
		empty
		(if (empty? (rest liste))
			(first liste)
			(f (rest liste)))))
```
Diese Funktion gibt das letzte Element einer Liste aus, bzw. iteriert durch eine Liste, bis es ein erstes Element und '() gibt, und gibt das letzte Element zurück.

### b)
```racket
(define (g liste)
	(cond
		((empty? liste) empty)
		((empty? (rest liste)) (first liste))
		(else
			(if (> (first liste) (g (rest liste)))
				(first liste)
				(g (rest liste))))))
```

Sortiert die Liste der Grösse und gibt dieses Element zurück.

## 4. Aufgabe *
Entwickeln Sie eine Funktion, die ein bestimmtes Element aus einer Liste entfernt. Die Definition der Funktion lautet:

```racket
(define (delete item a-list)
```

Beispiel zur Anwendung der Funktion:

```racket
> (delete 3 (list 1 2 3 4))
(list 1 2 4)
> (delete 'c '(a b c d))
(list 'a 'b 'd)
> (delete 'f '(a b c d))
(list 'a 'b 'c 'd)
> (delete 'f empty)
'()
> (delete 'f (list 1 2 3 4))
(list 1 2 3 4)
```

```racket
(define (delete item a-list)
	(cond 
		((empty? a-list) empty)
		(else
			(cond
				((eq? item (first a-list))
					(delete item (rest a-list))
				)
				(else 
					(cons (first a-list) (delete item (rest a-list)))
				)
			)
		)
	)
)
(delete 3 (list 1 2 3 4))
(delete 'c '(a b c d))
(delete 'f '(a b c d))
(delete 'f empty)
(delete 'f (list 1 2 3 4))
```

## 5. Aufgabe

Entwickeln Sie eine Prädikatfunktion, die feststellt, ob ein bestimmtes Element in einer Liste vorhanden ist. Die Definition der Funktion lautet:

```racket
(define (contains? item a-list)
```

Beispiel zur Anwendung der Prädikatfunktion:

```racket
> (contains? 'c '(a b c d))
true
> (contains? 'f '(a b c d))
false
```

## 6. Aufgabe
Die Folie 23 aus PCP-Scheme-4 zeigt die Funktion `list-filter`, um eine Liste zu untersuchen und ggf. eine Resultatliste zu erstellen.

```racket
(define (list-filter rel-op a-list value)
	(cond
		[(empty? a-list) empty]
		[else
			(cond
				[(rel-op (first a-list) value)
					(cons (first a-list)
						(list-filter rel-op (rest a-list) value)
					)
				]
				[else (list-filter rel-op (rest a-list) value)]
			)
		]))
```

Die Tests wurden nur mit Listen von Zahlen durchgeführt. Testen Sie die Funktion auch für folgende Situationen

### a) Suche ein bestimmtes Symbol in einer Liste von Symbolen

### b) Suche ein bestimmtes Zeichen in einer Liste von Zeichen

### c) Suche einen bestimmten String in einer Liste von Strings


## 7. Aufgabe *

Schreiben Sie eine eigene Prädikatfunktion für die Funktion `list-filter`, welche untersucht, ob es eine oder mehrere Zahlen in einer Liste von Zahlen gibt, die teilbar durch eine bestimmte (als Parameter gegebene) Zahl ist.

## 8. Aufgabe *

Sie kennen die Implementation des Sortierens durch Einfügen:

```racket
; Sortieren durch Einfügen
(define (sort-a-list num-list)
	(cond
		((empty? num-list) empty)
		(else (insert (first num-list)
		(sort-a-list (rest num-list))))
	)
)

; Einfügen in sortierter Liste
(define (insert item a-list)
	(cond
		((empty? a-list) (list item))
		((<= item (first a-list)) (cons item a-list))
		(else (cons (first a-list) (insert item (rest a-list))))
	)
)
```

Die `sort-a-list` Funktion sortiert nur Zahlen von klein nach gross. Ändern Sie die `sort-a-list` Funktion so, dass die Sortierrichtung bestimmt und nicht nur Zahlen sondern auch Strings sortiert werden können.

## 9. Aufgabe *

### a) Untersuchen Sie die folgende Funktion. Was macht die Funktionen genau?

```racket
(define (a-op a)
	(cond
	[(>= a 0) +]
	[else -])
)
```

### b) Schreiben Sie eine Funktion abs-a-plus-b, welche die absoluten Werte von a und b zusammen zählt.
```racket
(define (abs-a-plus-b a b)
```

### c) Erweitern Sie die Funktion `abs-a-plus-b` zu `abs-a-op-b` damit man eine beliebige Operation mit den absoluten Werten von a und b durchführen kann.