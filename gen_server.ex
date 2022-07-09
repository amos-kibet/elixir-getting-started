defmodule AnnoyingPassengerAutoresponder do
  use GenServer
  # Client API

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  def are_we_there_yet?(pid) do
    GenServer.call(pid, :are_we_there_yet?)
  end

  # Server callbacks
  @impl GenServer
  def init(_init_arg) do
    # the initial count of questions asked is always 0
    state = 0
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:are_we_there_yet?, _from, state) do
    reply =
      cond do
        state <= 3 -> "No."
        state <= 10 -> "I told you #{state} times already. No."
        true -> "..."
      end

      # increase the count of questions asked
      new_state = state + 1
      # reply to the caller
      {:reply, reply, new_state}
  end
end
