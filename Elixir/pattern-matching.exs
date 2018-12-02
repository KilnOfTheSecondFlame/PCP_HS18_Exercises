greeting = "hello"
greet = fn
  # Matching auf hello
  (^greeting, name) -> "Hi #{name}"
  # Matching auf Symbol bye
  (:bye, name)      -> "Bye #{name}!"
  # Falls sonst nichts matcht, dann dieser Fall
  (greeting, name)  -> "Who are you? #{greeting} #{name}"
end

IO.puts(greet.("hello", "John"))
IO.puts(greet.("The Great", "Hans Muster"))
IO.puts(greet.(:bye, "Bob"))
