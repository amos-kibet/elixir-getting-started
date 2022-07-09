# Task 1
# Define if Pac-Man eats a ghost

# Define the Rules.eat_ghost?/2 function that takes two arguments (if Pac-Man has a power pellet active and if Pac-Man is touching a ghost) and returns a boolean value if Pac-Man is able to eat the ghost. The function should return true only if Pac-Man has a power pellet active and is touching a ghost.

# Rules.eat_ghost?(false, true)
# # => false

# Task 2
# Define if Pac-Man scores

# Define the Rules.score?/2 function that takes two arguments (if Pac-Man is touching a power pellet and if Pac-Man is touching a dot) and returns a boolean value if Pac-Man scored. The function should return true if Pac-Man is touching a power pellet or a dot.

# Rules.score?(true, true)
# # => true

# Task 3
# Define if Pac-Man loses

# Define the Rules.lose?/2 function that takes two arguments (if Pac-Man has a power pellet active and if Pac-Man is touching a ghost) and returns a boolean value if Pac-Man loses. The function should return true if Pac-Man is touching a ghost and does not have a power pellet active.

# Rules.lose?(false, true)
# # => true

# Task 4
# Define if Pac-Man wins

# Define the Rules.win?/3 function that takes three arguments (if Pac-Man has eaten all of the dots, if Pac-Man has a power pellet active, and if Pac-Man is touching a ghost) and returns a boolean value if Pac-Man wins. The function should return true if Pac-Man has eaten all of the dots and has not lost based on the arguments defined in part 3.

# Rules.win?(false, true, false)
# # => false

defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost) do
    if power_pellet_active and touching_ghost do
     true
    else
     false
    end
  end

  def score?(touching_power_pellet, touching_dot) do
    # Please implement the score?/2 function
    if touching_power_pellet or touching_dot do
     true
    else
     false
    end
  end

  def lose?(power_pellet_active, touching_ghost) do
    # Please implement the lose?/2 function
    if not power_pellet_active and touching_ghost do
     true
    else
     false
    end
  end

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    # Please implement the win?/3 function
    if has_eaten_all_dots and not lose?(power_pellet_active, touching_ghost) do
     true
    else
     false
    end
  end
end

# TheEndIsNear's Solution on Exercism
defmodule Rules do
  def eat_ghost?(true, true), do: true
  def eat_ghost?(_power_pellet_active, _touching_ghost), do: false
  def score?(_touching_power_pellet, true), do: true
  def score?(true, _touching_dot), do: true
  def score?(_touching_power_pellet, _touching_dot), do: false
  def lose?(false, true), do: true
  def lose?(_power_pellet_active, _touching_ghost), do: false
  def win?(true, _, false), do: true
  def win?(true, true, _), do: true
  def win?(_has_eaten_all_dots, _power_pellet_active, _touching_ghost), do: false
end
