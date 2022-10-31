defmodule TailRecursion do
  @doc """
  Counts & returns the length of a list
  Does not leverage tail recursion
  """
  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  @doc """
  Counts & returns the length of a list
  Uses tail recurtsion
  """
  def tail_recursive_count(list), do: do_count(list, 0)
  # implements tail recursion on the public function
  defp do_count([], acc), do: 0
  defp do_count([head | tail], acc), do: acc + 1
IO.inspect(TailRecursion.count([1,2,3,4]))
