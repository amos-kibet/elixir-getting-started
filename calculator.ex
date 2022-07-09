defmodule Calculator do
  # Public function
  def subtract(x, y) do
    private_subtract(x, y)
  end

  # Private function
  defp private_subtract(x, y) do
    x - y
  end
end

# Accessing public function
difference = Calculator.subtract(8, 4)
private_diff = Calculator.private_subtract(8, 4)
IO.puts(difference)
IO.puts(private_diff)
