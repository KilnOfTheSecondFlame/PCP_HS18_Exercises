defmodule PCPFibonacci do
  @moduledoc """
    Eine Implementation des Endrekursiven Fibonacci-Algorithmus aus SW03
  """
  def calc do
    count =
      String.trim(IO.gets("Gib eine Zahl ein: "), "\n")
    count =
      String.to_integer(count)
    resultat =
      fib_tr(count, 0, 1)
      IO.puts("Die " <> to_string(count) <> "te Zahl ist: " <> to_string(resultat))
  end
  defp fib_tr(0, a, _), do: a
  defp fib_tr(n, a, b) do
    n1 = n - 1
      if n1 >= 0 do
        sum = a + b
        fib_tr(n1, b, sum)
      end
  end
end

PCPFibonacci.calc()
