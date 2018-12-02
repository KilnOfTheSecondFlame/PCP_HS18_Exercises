a = 3
3 = a
# 2 = a
# ** (MatchError) no match of right hand side value: 3<
IO.puts(a)

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
