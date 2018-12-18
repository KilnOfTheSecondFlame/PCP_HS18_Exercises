# Enum
#   all?
#   any?
#   chunk_every
#   chunk_by
#   map_every
#   each
#   map
#   min
#   max
#   filter
#   reduce
#   sort
#   uniq_by

defmodule PCPStreams do
  @moduledoc false
  # Enum functions sind eager
  # Enums sind Collections in Elixir
  def powerSumPositive(list) when is_list(list) do
    list
    |> Enum.filter(&(&1 > 0))
    |> Enum.map(&(&1 * &1))
    |> Enum.reduce(0, &(&1 + &2))
    |> IO.puts()
  end

  def powerSumPositive(_) do
  	IO.puts("Attribute is not a list")
  end
end

PCPStreams.powerSumPositive([-1,2,4,6])
PCPStreams.powerSumPositive(%{name: "Decoodz", age: "24"})
