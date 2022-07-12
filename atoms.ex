defmodule Atomic do
  @moduledoc """
  Atoms are constans that represent something's name.
  An atom's name is its value.

  Uses:
    > As constants
    > As keys for maps (Maps with atom keys)
    > For Keyword lists
    > Tagging return values


  Examples:
  :fred, :is_binary?, :var@2, :<>, :===, :"func/3"
  :"long john silver", :true, :false, :etc
  """

  def atomic do
    answer = IO.gets("Enter an atom: ") # any string preceeded by a colon (:)
    IO.puts("Answer is: #{answer}") # value is the same atom
  end
end

Atomic.atomic()
