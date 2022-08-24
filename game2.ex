defmodule Game2 do
  @moduledoc """
  1. Ask the user whether they want to play or not and process the answer from above and determine whether or not they want to play
    a. Create a function that asks the user the question
    b. Create a function that processes the user's answer
        i. If the answer is yes, begin the game
        ii. If the answer is no, print "Goodbye"
        iii. If the answer is anything else, ask the question again

  2. Generate a random arithmetic question
    a. Create a function that returns a random number between 1 and 9
    b. Create a function that returns a random arithmetic sign
    c Create a function that generates a question to ask the user
    d. Create a function that asks the user the arithmetic question

  3. Evaluate the answer entered from step above
      a. Find the correct answer from the question asked
      b. Compare the correct answer to the answer entered by user
      c. Return appropriate response from the comparisons
          1. If correct:
              a. Print "Answer Correct"
              b. Ask the user if they want to play again

          2. If not correct:
              a. Print "The correct answer is 30"
              b. Ask the user if they want to play again
  """


  @doc """
  Asks the user user whether or not they want to play and then process their answer
  """
  def start do
    question = "Do you wish to play a game? Choose Yes or No\n"

    question
    |> ask_question()
    |> process_wants_to_play()
  end

  # asks the user a question and waits for user's input
  defp ask_question(question) do
    question
    |> IO.gets()
    |> String.trim()
  end

  # processes answer on whether the user wants to play or not
  defp process_wants_to_play(answer) do
    case String.downcase(answer) do
      "yes" ->
        ask_arithmetic_question()
        start()

      "no" ->
        IO.puts("Goobye")

      _other ->
        IO.puts("Invalid choice. Choose either Yes or No")
        IO.puts("\n")
        start()
    end
  end

  @doc """
  Ask the user a randomly generated arithmetic question
  """
  def ask_arithmetic_question do
    question = generate_arithmetic_question()

    question
    |> ask_question()
    |> process_arithmetic_question_answer(question)
  end


  # Generates the arithmetic question to ask the user
  defp generate_arithmetic_question do
    "#{random_number()} #{random_sign()} #{random_number()}\n"
  end

  # generates a random number btwn 1 and 9
  defp random_number, do: Enum.random(1..9)

  # generates random arithmetic sign
  defp random_sign, do: Enum.random(["+", "-", "/", "*"])

  # processes the answer entered by the user to the arithmetic question
  defp process_arithmetic_question_answer(answer, question) do
    question # "4 + 5"
    |> String.split() # ["4", "+", "5"]
    |> Enum.map(&change_to_integer/1) # [4, "+", 5]
    |> perform_arithmetic_operation()  # 9
    |> compare_actual_to_entered_answer(answer)
  end

  defp change_to_integer(input) do
    case input do
      value when value in ["+", "-", "*", "/"] -> value
      value -> String.to_integer(value)
    end
  end

  defp perform_arithmetic_operation([first, sign, second]) do
    case sign do
      "+" -> first + second
      "-" -> first - second
      "*" -> first * second
      "/" -> first / second
    end
  end

  defp compare_actual_to_entered_answer(actual, entered) do
    if actual == String.to_integer(entered) do
      IO.puts("Your answer is correct\n")
    else
      IO.puts("The corrrect answer is #{actual}\n")
    end
  end

end
