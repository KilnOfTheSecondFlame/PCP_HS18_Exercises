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
  - Tupel: Zugriff der Werte über ein Index

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
