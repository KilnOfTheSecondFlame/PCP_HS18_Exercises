IO.puts("--- Lists ---\n")
# Kennen wir von pipes schon
list = [1, 2, 3, 4, 5]
[head | _tail] = list
IO.puts(head)
for x <- list, do: IO.puts(x*x)

# Funktioniert jedoch auch mit anderen Collections

IO.puts("\n\n--- Keyword Lists ---\n")
# Keyword list
dep_bundesrat = [efd: "Maurer", eda: "Cassis", edi: "Berset",
  wbf: "Schneider-Ammann", vbs: "Parmelin", ejpd: "Sommaruga", uvek: "Leuthard"]
IO.puts(dep_bundesrat[:efd])

for  {dep, br} <- dep_bundesrat do
  IO.puts(String.upcase("#{dep}") <> ": " <> br)
end

IO.puts("\n\n--- Maps ---\n")
# Maps
alphabet = %{
  1 => "a",
  3 => "c",
  2 => "b"
}
IO.puts(alphabet[2])
resultat =
  for {index, letter} <- alphabet, do: {index, letter}
IO.inspect(resultat)

IO.puts("\n\n--- Binaries ---\n")
# Binaries
string = "PCP.HS2018"
resultat =
  for <<c <- string>>, do: <<c>>
IO.inspect(resultat)

IO.puts("\n\n--- Nested Generators ---\n")
# Mehrere Generatoren
anzahl = [1, 2, 3]
for n <- anzahl, wiederholungen <- 1..n do
  IO.puts(String.duplicate("Na", wiederholungen))
end
IO.puts("Batman!")

IO.puts("\n\n--- Option :into ---\n")
# Bisher haben wir nur Listen produziert, was wenn wir beispielsweise eine
# keyword list in eine Map transformieren wollen?
# wir gebrauchen :into
resultat =
  for {dep, br} <- dep_bundesrat, into: %{}, do: {dep, br}
IO.inspect(resultat)
