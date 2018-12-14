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

  # Stream sind lazy
  def powerSumPositiveStream(list) when is_list(list) do
    list
    |> Stream.filter(&(&1 > 0))
    |> Stream.map(&(&1 * &1))
    |> Stream.take(10)
    |> Enum.to_list()
    |> Enum.reduce(0, &(&1 + &2))
    |> IO.inspect()
  end

  def powerSumPositiveStream(_) do
  	IO.puts("Attribute is not a list")
  end

end

PCPStreams.powerSumPositive([-1,2,4,6])
PCPStreams.powerSumPositive(%{name: "Fred", age: "56"})
PCPStreams.powerSumPositiveStream(Enum.to_list(-10..100_000))
