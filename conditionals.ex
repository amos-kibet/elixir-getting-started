defmodule Conditionals do
  @moduledoc """

  Objectives:
    1. List the conditional flows in Elixir
    2. Get familiar with the conditional clauses
    3. Get comfortable with making a choice between them



  1. Case
  -----------

  => Think of case as switch from javascript (However, more powerful and functional)

  When to use it?
  ----------------a

  - Used when you want to do different things based on the value of the given condition, especially
    if the value is not true or false

  - It works by pattern matching the value of the given expressions to a number of provided matches and
    and executes the code within the first exact match


  Syntax:
  ---------

    case expression do
      pattern1 [guards1, gauard2, ..gauardN] ->
        expression1

      pattern2 [gaurad1, guard2, ..guardN] ->
        expression2

      patternN ->
        expressionN

    end
  """

  @doc """
  This is a simple calulator  function that performs on of the basic 4 arithmetic
  calculation depending on the sign provided

  ## Examples
      iex> calculate(+, 1, 2)
      3

      iex> calculate(-, 3, 2)
      1

      iex> calculate(/, 10, 2)
      5

      iex> calculate(*, 2, 3)
      6

  """

  # defguard is_string(value) when is_binary(value)

  def calculate(sign, a, b) when is_binary(sign) do
    # in this example we will use case to perfom the different operations
    case sign do
      "+" ->
        a + b

      "-" ->
        a - b

      "/" ->
        a / b

      "*" ->
        a * b
    end
  end

  def calc_with_fun("+", a, b), do: a + b
  def calc_with_fun("-", a, b), do: a - b
  def calc_with_fun("*", a, b), do: a * b
  def calc_with_fun("/", a, b), do: a / b

  def calc_with_fun(sign, a, b) when sign == "+", do: a + b
  def calc_with_fun(sign, a, b) when sign == "-", do: a - b

  # We use if, when we are conparing a conditionals that return either true or false
  def is_valid?(value) do
    if value == true do
      IO.puts("Is valid")
    else
      IO.puts("Not valid")
    end
  end

  # cond is used to match different expressions and executes the first that returns true
  def calculate_with_cond(sign, a, b) do
    cond do
      sign == "+" -> a + b
      sign == "-" -> a - b
      sign == "/" -> a / b
      sign == "*" -> a * b
    end
  end
end





defmodule Conditionals.Questions do
  @moduledoc """
  Excercise:

  Note:
    1. Use only Conditional Flows to control the game
    2. To ask an recieve inputs to and from the terminal, research on the IO module in Elixir Documentation
    3. To generate random thing, explore the Enum module
    5. To procees input entered by user, explore the String module


  For this excercise, I want you to develop a simple math game meant to teach a child
  basic aarithmetic skills.

  How it works?
  -------------
  1. When you start the game, it asks the child whether they would like to play or not
    Example:
    iex> Game.start()
    G: Do you wish to play or not?
    p: Yes or No

  2. If the user types Yes, the game starts if not, the game ends by printing a goodbye message
    Example (Don't want to play):
    iex> Game.start()
    G: Do you wish to play or not?
    P: No
    G: Goobye

    Example (I want to play):
    iex> Game.start()
    G: Do you wish to play or not?
    P: Yes
    G: Let's get started.

    Example (Unrecognized input)
    iex> Game.start()
    G: Do you wish to play or not?
    P: Cow
    G: Wrong input. Choose either Yes or No
    P: No

  3. If the child said yes, and the game has printed let's get started. It asks the child a random math question
    Ensure that, on starting the game again, the questions should not be similar. (The numbers and the signs should
    be chosen at random)
    Example:
    G: 5 + 5 =
    P: 10

  4. The game will check whether the answer is correct, and return a response
      Examples (Answer  is correct)
      G: 5 + 5 =
      p: 10
      G: Correct!
      G Do you wish to play again?

      Example (Answer is wrong)
      G: 5 + 5
      P: 4
      G: Wrong answer. The correct answer is 10
      G: Do you wish to play again?


  """
end
