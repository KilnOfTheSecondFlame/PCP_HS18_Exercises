IO.puts("--- Pattern Matching on variables ---\n")
a = 3
3 = a
# 2 = a
# ** (MatchError) no match of right hand side value: 3<
IO.puts(a)

IO.puts("\n\n--- Pattern Matching in functions ---\n")
greeting = "hello"
greet = fn
  # Matching auf hello. greeting nicht rebinden
  (^greeting, name) -> "Hi #{name}"
  # Matching auf Symbol bye
  (:bye, name)      -> "Bye #{name}!"
  # Falls sonst nichts matcht, dann dieser Fall. greeting wird rebindet
  (greeting, name)  -> "Who are you? #{greeting} #{name}"
end

IO.puts(greet.("hello", "John"))
IO.puts(greet.("The Great", "Hans Muster"))
IO.puts(greet.(:bye, "Bob"))

IO.puts("\n\n--- Pattern Matching in attributes ---\n")
# Patternmatching in attribut - Hier map key 'name'
defmodule Greeter do
  def hello(%{name: person_name}) do
    IO.puts "Hello, " <> person_name
  end
end

bob = %{
	name: "bob",
	age: 24,
	favourite_cypher: "RSA"
}

Greeter.hello(bob)
