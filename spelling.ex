# Write a simple game that provides the user with 5 random letters and asks them to
# guess the correct word.
# Everytime they enter a word, you will tell them how close they are to the correct word

## Examples
# iex> Game.start()
# Game: Do you wish to play a game?
# User: No
# Game: Goodbye

# iex> Game.start()
# Game: Do you wish to play the game?
# User: Yes
# Game: Guess the word formed from the given list ["p", "l", "o", "p", "e"]
# User: peplo
# Game: You are getting warm
# User: leopp
# Game: You are way off!
# User: people
# Game: Correct!
# Game: Do you wish to try another word?
# User: no
# Game: Goodbye

defmodule Spelling do
  # Steps:
  #   Create a function that asks the user if they want to play a game or not.
  #     If no:
  #       Say Goodbye
  #     If yes:
  #       Start game
  #     If other input:
  #       Say "Wrong answer. Please enter either "yes" or "no" "
  #
  #   Create a function that generates a list of 5 random letters.
  #   Create a function that asks the user to guess a word
  #   Create a function that compares the user's guess to possible correct words
  #   Create a function that tells the user if their guess was right or wrong.
  #     If wrong:
  #       Create a function that checks how close the guess is to the answer:
  #         If close:
  #           Say "You are warm", and ask if the user wants to play the game again
  #         If far:
  #           Say "You are cold", and ask if the user wants to play the game again
  #     If right:
  #       Say "You are hot!", and ask if the user wants to play the game again.

  @doc """
  starts the game
  asks the user to form a word from the given combination of letters
  """
  def start_game do
    answer = play_game?()

    answer
    |> check_user_input()
    |> generate_random_letters()


    # |> get_user_answer()
    # |> announce_results()
  end

  @doc """
  Asks the user if they want to play a game or not
  Returns Yes, No, or _other_value
  """
  def play_game?, do: IO.gets "Do you want to play a game?\n"

  @doc """
  Grabs user's answer and cleans it
  """
  def get_user_input do
    user_answer = play_game?() # "yes\n" or "no\n", or _other

    user_answer
    |> String.trim() # results in "yes" or "no" with any possible combinations of case (upper or lower)
    |> String.downcase()
  end

  @doc """
  Checks user's answer for a "Yes" or "No"
  """

  def check_user_input(answer) do
    # user_answer = get_user_input()

    case answer do
      "no" ->
        IO.puts "Goodbye!"
      "yes" ->
        IO.puts "Great. Let's get started!\n"
        start_game()
      _other ->
        IO.puts "Wrong answer. Please enter either \"yes\" or \"no\"\n"
        start_game()
    end

  end


  # Generates a list of random letters
  def generate_random_letters(word_bank) do
    word_bank = ["good", "goof", "bad", "thing", "word", "brew", "chew", "breed"]

    word_bank
    |> Enum.random() # returns a random atom from the list
    # |> IO.inspect()
    |> String.graphemes() # returns a list of characters, formed from the string above
    |> Enum.shuffle()
  end

  @doc """
  gets user answer
  """
  def get_user_answer() do
    # IO.puts "Form a word from this combination: #{generate_random_letters()}\n"
    # combination = generate_random_letters()
    # IO.puts("\n")
    answer = IO.gets("Form a word from this combination: #{generate_random_letters()}\n")

    answer
    |> IO.inspect()
  end
end
