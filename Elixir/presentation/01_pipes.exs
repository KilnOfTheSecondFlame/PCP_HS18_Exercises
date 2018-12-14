defmodule PCPPipes do
  @moduledoc false
  def getPositives(list) when is_list(list) do
    for x <- list, is_positive(x) do
      x
    end
  end

  def is_positive(x) when is_integer(x) do
    x>0
  end

  def getPower(list) when is_list(list) do
    for x <- list do
      x * x
    end
  end

  def getSum(list) when is_list(list) do
    getSum(list,0)
  end
  defp getSum([],sum), do: sum
  defp getSum(list, sum), do: getSum(tl(list), sum + hd(list))
end

# Pipes-Funktionalität zeigen
[-5,-4,-3,-2,-1,0,1,2,3,4,5] |> PCPPipes.getPositives |> IO.inspect

# Mehrere Funktionen hintereinander
# 1,2,3,4,5 -> 1,4,9,16,25 -> 55
[-5,-4,-3,-2,-1,0,1,2,3,4,5] |> PCPPipes.getPositives |> PCPPipes.getPower |> PCPPipes.getSum |> IO.puts

# Einleitung in Enum/Streams
