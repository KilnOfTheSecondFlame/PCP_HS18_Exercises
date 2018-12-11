# Kennen wir von pipes schon
list = [1, 2, 3, 4, 5]
for x <- list, do: x*x

# Funktioniert jedoch auch mit anderen Collections

# Keyword list
dep_bundesrat = [efd: "Maurer", eda: "Cassis", edi: "Berset",
  wbf: "Schneider-Ammann", vbs: "Parmelin", ejpd: "Sommaruga", uvek: "Leuthard"]
IO.puts(dep_bundesrat[:efd])

for  {dep, br} <- dep_bundesrat do
  IO.puts(String.upcase("#{dep}") <> ": " <> br)
end
