defmodule Simple do
  @moduledoc false

  @doc """
  Play game
  """
  def play_game do
    with {:ok, answer} <- {:ok, ask_whether_to_play()},
         {:ok, :play} <- {:ok, process_whether_to_play(answer)},
         {:ok, word} <- {:ok, get_random_word()},
         {:ok, shuffled} <- {:ok, shuffle_word(word)},
         {:ok, guessed_word} <- {:ok, ask_for_word_guess(shuffled)} do
      process_guessed_word(word, guessed_word)
    else
      {:ok, :dont_play} -> IO.puts("Goodbye")
      {:ok, :reask_question} -> play_game()
    end
  end

  defp ask_whether_to_play do
    question = "Do you want to play (Yes or No)? \n"

    question
    |> ask_question()
  end

  defp process_whether_to_play(answer) do
    case String.downcase(answer) do
      "no" -> :dont_play
      "yes" -> :play
      _ -> :reask_question
    end
  end

  defp get_random_word do
    Enum.random(["good", "goof", "think", "chew", "home", "boat", "ship"])
  end

  defp shuffle_word(word) do
    word
    |> String.graphemes()
    |> Enum.shuffle()
  end

  defp ask_for_word_guess(letters) do
    question = "Guess the correct word from these letters: #{inspect(letters)}: \n"

    question
    |> ask_question()
  end

  defp process_guessed_word(actual, guess) do
    similarity = String.jaro_distance(actual, guess)

    cond do
      similarity >= 0.0 and similarity <= 0.5 -> IO.puts("You're getting colder")
      similarity > 0.5 and similarity < 1.0 -> IO.puts("You're getting warmer")
      true -> IO.puts("You guess is correct")
    end
  end

  # utility function for asking a question
  defp ask_question(question) do
    question
    |> IO.gets()
    |> String.trim()
  end
end
