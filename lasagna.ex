# defmodule Lasagna do
#   # Implicitly defined values
#   # Please define the 'expected_minutes_in_oven/0' function
#   def expected_minutes_in_oven do
#     _t = 40
#   end
#   # Please define the 'remaining_minutes_in_oven/1' function
#   def remaining_minutes_in_oven(actual_time) do
#     t = expected_minutes_in_oven()
#     _remaining_time = t - actual_time
#   end
#   # # Please define the 'preparation_time_in_minutes/1' function
#   def preparation_time_in_minutes(layers) do
#     _minutes = layers * 2
#   end
#   # # Please define the 'total_time_in_minutes/2' function
#   def total_time_in_minutes(num_layers, num_minutes) do
#     minutes = preparation_time_in_minutes(num_layers)
#     _total_time = minutes + num_minutes
#   end
#   # # Please define the 'alarm/0' function
#   def alarm do
#     "Ding!"
#   end
# end

# vrcca's Solution on Exercism
defmodule Lasagna do
  @minutes_in_total 40
  @minutes_per_layer 2
  def expected_minutes_in_oven(), do: @minutes_in_total
  def remaining_minutes_in_oven(passed), do: expected_minutes_in_oven() - passed
  def preparation_time_in_minutes(layers), do: layers * @minutes_per_layer
  def total_time_in_minutes(layers, passed), do: preparation_time_in_minutes(layers) + passed
  def alarm(), do: "Ding!"
end

 tester = Lasagna.alarm()
 IO.puts(tester)
