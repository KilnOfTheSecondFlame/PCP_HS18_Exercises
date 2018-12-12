# SW06 - Scheme 3+4 Task 4
defmodule ListOp do
  # Simple Case Return empty list
  def delete_el(_, []) do
    []
  end
  def delete_el(item, aList) do
    # Get first element of the list and the rest
    [head | tail ] = aList
    case head do
      # if item is equals first element --> call recursive only with tail
      n when item === n -> delete_el(item, tail)
      # If not equals, then add head and call recursive with tail
      _ -> [head | delete_el(item, tail)]
    end
  end
end

# testing
aList = [1, 3, 5, 76, 3, 2, 10]
IO.inspect(ListOp.delete_el(2, aList))
symbolList = [:a, :b, :c, :d, :e, :f]
IO.inspect(ListOp.delete_el(:e, symbolList))
# Element not in list
IO.inspect(ListOp.delete_el(:g, symbolList))
# Empty list given
IO.inspect(ListOp.delete_el(:g, []))
# Wrong type
IO.inspect(ListOp.delete_el(:g, aList))
