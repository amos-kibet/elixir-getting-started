defmodule Adding do
  def plus_three(number), do: number + 3
end

# iex> Enum.map([1, 2, 3], &Adding.plus_three(&1)) => capturing a named function and variable
# [4, 5, 6]

# iex> Enum.map([1, 2, 3], &Adding.plus_three/1) => capturing a named function without capturing the variable
# [4, 5, 6]
