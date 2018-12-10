defmodule PCPStreams do
  def PowerSumPositive(list) do
    list
    |> Enum.filter(&(&1 > 0))
    |> Enum.map(&1 * &1)
    |> Enum.reduce(0, &(&1 + &2))
  end
end
