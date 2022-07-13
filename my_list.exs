defmodule MyList do
  # Squaring a list
  def square([]), do: []
  def square([head|tail]), do: [head*head | square(tail)]

  # Getting length of a list
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail) # undescore head to avoid unused vairable warning

  # generalizing list functions to one function (map)
  # map/2 takes a list and a function and returns a new list containing the result of applying that function to each element in the list
  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head) | map(tail, func)]

  # iex
  # func is an anonymous function that you will need to define
  # for every operation you want to perform;
  # it could be addition, subtraction, multiplication, etc
  # iex(1)> c "my_list.exs"
  # [MyList]
  # iex(2)> MyList.map [1,2,3,4], fn (n) -> n*n end
  # [1,4,9,16]
  #
  # iex(3)> MyList.map [1,2,3,4], fn (n) -> n+1 end
  # [2,3,4,5]
  #
  # we can also use the shorthand (&) notation
  # MyList.map [1,2,3,4], &(&1 + 1)
  # [2,3,4,5]
end
