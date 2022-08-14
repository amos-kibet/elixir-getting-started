# defmodule User do
#   defstruct [:name, :age]
# end

# defmodule Bio do
#   defstruct name: "Kibet", age: "Why bother"
# end

defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end

defmodule Name do
  defstruct first_name: "", last_name: ""
end

defmodule Profile do
  defstruct user: %Name{}, age: ""
end
