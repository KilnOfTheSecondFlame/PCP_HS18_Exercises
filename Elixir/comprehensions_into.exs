defmodule Comprehensions do
  def basic() do
    # Basic Comprehensions --> Range 1 to 10
     for n <- 1..10 do
       # Print Pow 2
        IO.puts(n * n)
      end
  end
  # Comprhension with into
  def compInto(values) do
    # Filter only cities (city atom) and put matched values in a list and in uppercase
    cities = for {:city, val} <- values, into: [], do: String.upcase(val)
    # Print list
    IO.inspect(cities)
  end
end
Comprehensions.basic()
geo = [city: "Berlin", city: "New York", country: "Germany",
  city: "Barcelona", country: "Italy", country: "Spain", city: "Stockholm"
]
Comprehensions.compInto(geo)
