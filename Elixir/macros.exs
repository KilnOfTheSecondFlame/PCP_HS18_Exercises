defmodule Unless do
  defmacro macro_unless(clause, do: expression) do
    quote do
      if(!unquote(clause), do: unquote(expression))
    end
  end
end

# require Unless
# ausdruck = quote do: Unless.macro_unless(true, do: IO.puts "Dies sollte nicht ausgegeben werden")
# IO.puts Macro.to_string(Macro.expand_once(ausdruck, __ENV__))
