defmodule PCPStreams do
  def powerSumPositive(list) when is_list(list) do
    list
    |> Enum.filter(&(&1 > 0))
    |> Enum.map(&(&1 * &1))
    |> Enum.reduce(0, &(&1 + &2))
    |> IO.puts()
  end
end

PCPStreams.powerSumPositive([-1,2,4,6])
