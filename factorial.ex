# defmodule Factorial do
#   def fact(n) do
#     (n==1 or n==0) && 1 || n * fact(n-1)
#   end

# end

# {number, _} = IO.gets("Enter a number: ") |> Integer.parse
# answer = Factorial.fact number
# IO.puts("Answer is: #{answer}")

# Another solution, using pattern matching

# defmodule Factorial do
#   def of(0), do: 1
#   def of(n), do: n * of(n-1)
# end
