# Elixir Documentation

## Fokuspunkte
- The Actor Model (Shared nothing concurrent programming )
- Abgrenzung von Erlang
- Enumerables and Streams (lazy & async)
- Pattern Matching
- Comprehensions and into-Option
- Macros and Quotes


## Grundlagen
- Elixir ist eine funktionale Programmiersprache.
- Es ist stark dynamisch typsiert (zur Laufzeit).
- Elixir Datenstrukturen sind immutable. Z.B. eine Konkatation von zwei Listen, wird eine neue Liste generiert.
- Das Programm läuft auf der Erlang VM/OTP VM
  - Somit wird das Elixir Programm in Byte-Code für den Erlang VM kompiliert.
- Datenstrukturen:
  - List (Als LinkedList)
```Elixir
list = [1, 2, 3, 4, 5]
```
  - Tupel: Zugriff der Werte über ein Index
```Elixir
tupel = (:a, 1)
```
  - Map: key-value Paar
```Elixir
map = %{:a => 1, 2 => :b}
```

## Abgrenzung zu Erlang

* Moderner Syntax

Erlang:
```Erlang
% hello world program
-module(helloworld).
-import(io,[fwrite/1]).
-export([start/0]).

start() ->
   fwrite("Hello, world!\n").
```

Elixir:
```Elixir
defmodule helloworld do
  def start do: IO.puts("Hello, World!\n")
end
```
* Protocols

Erlauben Polymorphismus für existierende atome
```Elixir
defimpl String.Chars, for: Tuple do
  def to_string(tuple) do
    interior =
      tuple
      |> Tuple.to_list()
      |> Enum.map(&Kernel.to_string/1)
      |> Enum.join(", ")

    "{#{interior}}"
  end
end
```
Zum Testen, vorher/nachher:
```Elixir
to_string({"PCP",:HS,2018})
```

* Pipe operator
* Variabeln können überschrieben werden
* Macros

In Elixir wird der Abstrakte Syntax-Baum (AST) aus Tupel {a, b} aufgebaut.
Diese Tupel beinhalten den Funktionsnamen, Metadaten und Funktionsargumente.
Um diese Strukturen zu sehen, können wir die `quote/2` Funktion gebrauchen.

Wir können mithilfe der Funktionen `quote/2` und `unquote/1` jedoch auch
Code-Injection betreiben -> Macros.

* Function exporting at the definition (def vs defp) (Gültigkeitsbereich)
* Mix build tool: Automatische Projektinitialisierung
* Built in test (ExUnit)
* Built in Dokumentation
    * Tests in Dokumentation (DocTest)
