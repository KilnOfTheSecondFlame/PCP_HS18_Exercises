# Elixir Documentation

## Fokuspunkte
- The Actor Model (Shared nothing concurrent programming )
- Abgrenzung von Erlang
- Enumerables and Streams (lazy & async)
- Pattern Matching

## Grundlagen
- Elixir ist eine funktionale Programmiersprache.
- Es ist stark dynamisch typsiert (zur Laufzeit).
- Elixir Datenstrukturen sind immutable. Z.B. eine Konkatation von zwei Listen, wird eine neue Liste generiert.
- Das Programm läuft auf der Erlang VM/OTP VM
  - Somit wird das Elixir Programm in Byte-Code für den Erlang VM kompiliert.
- Datenstrukturen:
  - List (Als LinkedList)
  ```
list = [1, 2, 3, 4, 5]
  ```
  - Tupel: Zugriff der Werte über ein Index
  ```
tupel = (:a, 1)
  ```
  - Map: key-value Paar
  ```
map = %{:a => 1, 2 => :b}
  ```

## Abgrenzung zu Erlang

[comment]: # "TODO Just pointers at the moment -> Expand"
* Modern syntax
* Protocols
* Pipe operator (reduce nested functions)
* Rebindable variables
* Macros
* Function exporting at the definition (def vs defp)
* Mix build tool
* Built in test (ExUnit)
* Built in docs
    * tests in docs (DocTest)
