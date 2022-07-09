# Named function
defmodule NamedFunction do
  def function_name(param) do
    param + 1
  end


end

loader = NamedFunction.function_name(1)
IO.puts(loader)
