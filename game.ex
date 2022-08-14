
defmodule Game do
  @moduledoc """
  Excercise:

  Note:
    1. Use only Conditional Flows to control the game
    2. To ask and receive inputs to and from the terminal, research on the IO module in Elixir Documentation
    3. To generate random thing, explore the Enum module
    5. To process input entered by user, explore the String module


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
    G: Let's get started. Call a game start function.

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

  @doc """
  Define a game start function that takes user input and make decisions based on them.
  """
  def start() do
    user_input = String.trim(IO.gets("Do you wish to play a game or not ? ")) # use of String.trim trims user input so it exactly matches case conditions
    # user_input = IO.gets("Do you wish to play a game or not ? ")

    # question = "Do you wish to play a game or not ? "

    # question
    # |> IO.gets()
    # |> String.trim()

    # a(b((c(d(e(f(6))))))

    # 6
    # |> f()
    # |> e()
    # |> d()
    # |> c()
    # |> b()
    # |> a()


    IO.puts(user_input) # for logging & debugging purposes
    case user_input do
      "yes" ->
        IO.puts("Welcome to the game!")
        # call game_start/0 function
        start_game()

      "no" ->
        IO.puts("Goodbye")
      _ ->
        IO.puts("Wrong choice. Choose either \"yes\" or \"no\"")
        start()
    end

    # if user_input == "yes" do
    #   IO.puts("Welcome to the game!")
    # else
    #   IO.puts("Goodbye")
    # end
  end

  @doc """
  Define start_game/0 function that does basic arithmetic operations on two random integers
  """
  def start_game() do
    a = Enum.random(1..100) # can be more, chose 100 for a start
    b = Enum.random(1..100)
    operator = Enum.random(["+", "-", "*", "/"])

    case operator do
      "+" ->
        add = a + b
      "-" ->
        subtract = a - b
      "*" ->
        multiply = a * b
      "/" ->
        divide = a / b
    end

    user_input = IO.gets("What is the answer of #{a} #{operator} #{b} ? ")
    # IO.puts(user_input)
    # if user_input ==  do
    #   IO.puts("Correct")
    # else IO.puts("Wrong")
    # end
    # def validate_user_input() do
    #   IO.puts(user_input)
    # end

    # if user_input == add or user_input == subtract or user_input == multiply or user_input == divide do
    #   IO.puts("Correct")
    # else IO.puts("Wrong")
    # end
  end

end
