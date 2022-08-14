defmodule Lists do
  @moduledoc """
  Objectives:

  1. How to work with lists in Elixir


  2. How create recursive functions
  3. Using the Enum module with lists

  # What are lists?

  [1,2,3,4] => list

  [1, "name", %{}, :atom] => Can be made of different data types.

  keyword list

  => A list of tuples containing two elements in the tuple and the first element is an atom

    What makes up a list

  A list is made up two things
  1. head
  2. tail

  The head is the first element in a lists
  The tail is the list left behind when you remove the first element

  [1, 2, 3, 4]

  head = 1,
  tail = [2, 3, 4]

  list = [1,2,3,4]

  [1 | [2 | [3 | [4 | []]]] ]

  Building a list:

  => prepending is faster than appending

  list = [1,2,3]

  list2 = [4 | list]

  list = [5 | list2]

  [list1 | [5]] = [1, 2, 3, 5]

  [[1, 2, 3], 5]

  list ++ [5]

  Recursion
  ---------

  A recursion occurs when a function calls itself

  Example. def sum([1,2,3]), do: sum(list)

  When defining recursion, you must declare a stop clause

  """

  @doc """
  Given a list of numbers, it returns the sum of the numbers

  ### Examples
      iex> sum([1,2,3,4])
      10

  """
  def sum([h | tail]) do
    if tail == [], do: h, else: h + sum(tail)
  end

  @doc """
  Solving using tail recursion

  A tail recursion happens when the last thing a function does is
  call itself or another function
  """
  def sum2(list) do
    sum(list, 0)
  end

  def sum([], current_sum), do: current_sum

  def sum([h | tail], current_sum) do
    new_sum = h + current_sum

    sum(tail, new_sum)
  end



end
