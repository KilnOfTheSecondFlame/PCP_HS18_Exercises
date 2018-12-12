# AST is composed out of tuples, these contain function name, metadata and function arguments
# Im interaktiven Interpreter / iex eingeben!
quote do: 1 + 2
quote do: IO.puts("Test")
denominator = 2
quote do: divide(42, denominator)
# Wir sehen, dass der AST ein Atom mit dem Namen :denominator eingefügt hat,
# wollen wir aber den Wert von :denominator im AST sehen, müssen wir dies mit
# unquote/1 definieren
quote do: divide(42, unquote(denominator))
