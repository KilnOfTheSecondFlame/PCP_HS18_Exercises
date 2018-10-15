# PCP Übung zu Prolog 5 + 6

## 1 Fibonacci-Zahlen Berechnen mit CLP-R

### a)
Falls nach einer nicht-Fibonacci Zahl gesucht wird, dann verfängt sich das Programm in eine Endlos-Rekursion
### b)
Das Programm findet keine Lösungen, wo F = F1+F2 F=0 oder 1 als simple case ergibt.
### c)
Eine Obergrenze für N setzen, dann bricht das Programm bei dieser Obergrenze ab.

## 3 CLP: Rätsel lösen
Das File clp.pl laden.

### a)
```prolog
{ Tochter = 15, Mutter = 3*Tochter, Mutter = 2*Tochter + Jahre }.
Tochter = Jahre, Jahre = 15.0,
Mutter = 45.0 .
```

### b)
```prolog
numbers_riddle([D,O,N,A,L,D] + [G,E,R,A,L,D] = [R,O,B,E,R,T]).
D = 5,
O = 2,
N = 6,
A = 4,
L = 8,
G = 1,
E = 9,
R = 7,
B = 3,
T = 0 .
numbers_riddle(Ds + Gs = Rs).
Ds = [5, 2, 6, 4, 8, 5],
Gs = [1, 9, 7, 4, 8, 5],
Rs = [7, 2, 3, 9, 7, 0] .
```

## 4 Familiäre Beziehungsabfragen & Sudokus lösen via HTTP
C:\Program` Files\Java\jre1.8.0_162\bin\java.exe -jar "C:\Users\Pascal\Dropbox (Personal)\Studium\02_Lektionsunterlagen\07_Semester07\06_PCP\PCP_HS18_Exercises\04_SW04\PCPProblemProvider-Java-8.jar"