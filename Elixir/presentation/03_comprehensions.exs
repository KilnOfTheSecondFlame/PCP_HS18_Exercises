dep_bundesrat = [efd: "Maurer", eda: "Cassis", edi: "Berset",
  wbf: "Schneider-Ammann", vbs: "Parmelin", ejpd: "Sommaruga", uvek: "Leuthard"]

IO.puts("\nDepartementsverteilung 2018\n")
for {dep, br} <- dep_bundesrat do
  IO.puts(String.upcase("#{dep}") <> ": " <> br)
end

resultat =
  for {dep, br} <- dep_bundesrat, into: %{} do
    case {dep, br} do
      {:vbs, _} -> {dep, "Amherd"}
      {:wbf, _} -> {dep, "Parmelin"}
      {:uvek, _} -> {dep, "Sommaruga"}
      {:ejpd, _} -> {dep, "Keller-Sutter"}
      {dep, br} -> {dep, br}
    end
end
IO.puts("\nDepartementsverteilung 2019 als Map\n")
IO.inspect(resultat)
