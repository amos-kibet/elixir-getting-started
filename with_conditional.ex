# defmodule User do
#   @moduledoc """
#   demonstrates use of with conditional
#   """

#   def user do
#     user = %{first: "Sean", last: "Callan"}

#     with {:ok, first} <- Map.fetch(user, :first),
#          {:ok, last} <- Map.fetch(user, :last)
#           do last <> ", " <> first
#     else
#       {:error, _error} -> IO.puts("My fren, you have errors!")
#     end
#   end

# end
#  IO.inspect(User.user())


defmodule Number do
  import Integer # we import this so that we can use its functions (is_even, div)

  def number do
    m = %{a: 45, c: 3}


      with {:ok, number} <- Map.fetch(m, :a),
      true <- is_even(number) do
        IO.puts "#{number} divided by 2 is #{div(number, 2)}"
        :is_even
      else
        :error ->
          IO.puts("We don't have this in map")
          :error
        _ ->
          IO.puts("It is odd")
          :is_odd
      end
  end
end

IO.inspect(Number.number())
