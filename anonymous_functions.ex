# Anonymous functions
function_variable = fn param -> param + 1 end

IO.puts(function_variable.(1))

variable = &(&1 + 1)
IO.puts(variable.(5))

# Using capture (&) with a function inside module
speak = &(IO.puts/1)
speak.("Hello, Amos!")

# Using & in local functions
# defmodule Issues.TableFormatter do
#   def put_in_columns(data_by_columns, format) do
#     Enum.each(data_by_columns, &put_in_one_row/1)
#   end

#   def put_in_one_row(fields) do
#     # Do some things...
#   end
# end

# Addition
add = fn a, b -> a + b end
IO.puts(add.(1, 2))
