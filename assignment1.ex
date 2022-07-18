# Defines a module called Greetings that exports functions that does the
# following:

# 1. Given the name of a person, it returns a greeting with that name
#   Example: Greetings.say_hello("John") => Hello, John

# 2. Given two arguements starting with small letters, it combines them
#     to a single string with each starting with a capital letter
#     Example: Greetings.combine_words("mary", "jane") => "Mary Jane"

defmodule Greetings do
  @moduledoc """
  Defines two functions, say_hello/1 and combine_words/2
  """

  @doc """
  Defines a function, say_hello/1
  that takes a name as an argument and returns the string: Hello, name
  """
  def say_hello(name) do
    IO.puts("Hello, #{name}")
  end

  @doc """
  Defines a function, combine_words/2 that takes two arguments starting with small letters, combines them to a single string with each starting with a capital letter
  Example: Greetings.combine_words("mary", "jane") => "Mary Jane"
  """
  def combine_words(text1, text2) do
    # capitalize(string, mode \\ :default) => capitalize the first letter
    # "StringA" <> " " <> "StringB.

    String.capitalize(text1) <> " " <> String.capitalize(text2)


    # Elixir is a functional programming language
    # Everything is immutable
    # You cannot do something similar to this:
    # some_variable.function_name
    # only allowed when variable is a map/struct and even then
    # it's used to access fields in the map. EG. map = %{name: "paul"}
    # name = map.name
  end
end
