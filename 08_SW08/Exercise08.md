# Exercise 08

## 1. Aufgabe

### a) Was gibt das Programm aus, wenn die main-Methode der Klasse Exercise1 aufgerufen wird?
Do it the SPECIFIC way.

### b) Die beiden Interfaces GeneralInterface und SpecificInterface implementieren beide die Methode public void doIt() und die Klasse Exercise1 implementiert beide Interfaces. Warum führt dies zu keinen Problemen mit Mehrfachvererbung?

SpecificInterface erbt von GeneralInterface. Aus diesem Grund gibt es keinen Konflikt.

### c) Angenommen, beim SpecificInterface würde extends GeneralInterace gestrichen. Gäbe es dann ein Problem mit Mehrfachvererbung? Falls Ja: Wie könnte dieses behoben werden? Falls Nein: Begründen Sie Ihre Antwort
Geht nicht, Exercise1 darf nicht mehrere Interfaces erben, die die Methode doIt implementieren. Der Compiler weiss, dann nicht, welche default Methode er nehmen sollte.

```
Error:(3, 8) java: class Exercise1 inherits unrelated defaults for doIt() from types GeneralInterface and SpecificInterface
```

Lösung: Man überschreibt die Methode.
```java
public class Exercise1 implements GeneralInterface, SpecificInterface {
    public static void main(String[] args) {
        Exercise1 ex1 = new Exercise1();
        ex1.doIt();
    }

    @Override
    public void doIt() {
        SpecificInterface.super.doIt();
    }
}
```


## 3. Eigenes funktionales Interface: TripleIntOperator

### b) Wie muss die entsprechende SAM-Methode von ihrem Interface heissen?
Nicht relevant. Es kann irgendwie heissen.

### c) Von welchem Typ muss dabei die Rückgabe der abstrakten Methode gemäss Namenskonvention des funktionalen Interfaces sein?
Es ist ein Operator, also muss der gleiche Datentyp zurückgegeben werden. In diesem Beispiel also int.

## 5. Sequentielle und parallele Streams

### b) Modifizieren Sie Ihren Code, so dass neu ein paralleler Stream verwendet wird. Die Ausgabe sieht jetzt beispielsweise so aus wie unten im Beispiel. Warum sind die Zahlen jetzt nicht mehr geordnet? Erläutern Sie diesen Sachverhalt.
Da nun die forEach Funktion auf mehreren Cores verteilt wird. Gewisse Core bekommen die System.out.println Ressource früher als die anderen Cores.
