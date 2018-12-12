# SW06 - Scheme 3+4 Task 4
defmodule ListFilter do
  # Simple Case Return empty list
  def list_filter(_, [], _) do
    []
  end
  def list_filter(rel_op, aList, item) do
    # Get first element of the list and the rest
    [head | tail ] = aList
    cond do
      # if rel_ops return true --> then add head and call recursive with tail
      rel_op.(head, item) -> [head | list_filter(rel_op, tail, item)]
      # If not equals, call recursive with tail
      true -> list_filter(rel_op, tail, item)
    end
  end
  def is_division(value1, value2) do
    rem(value1, value2) === 0
  end
end

# testing
aList = [1, 8, 5, 76, 3, 2, 10]
IO.inspect(ListFilter.list_filter(&<=/2, aList, 20))
# Use custom predicate
IO.inspect(ListFilter.list_filter(&ListFilter.is_division/2, aList, 2))
