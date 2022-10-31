defmodule Account do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    {:ok, %{balance: 0}}
  end

  # API
  def get_balance(pid) do
    GenServer.call(pid, :get_balance)
  end

  def deposit(pid, amount) do
    GenServer.cast(pid, {:deposit, amount})
  end

  def withdraw(pid, amount) do
    GenServer.cast(pid, {:withdraw, amount})
  end

  # callbacks
  def handle_call(:get_balance, _from, state) do
    {:reply, Map.get(state, :balance), state}
  end

  def handle_cast({:deposit, amount}, state) do
    # refactored from this to the below uncommented code
    # {balance = Map.get(state, :balance)
    # {:noreply, Map.put(state, :balance, balance + amount)}}

    # update_balance = fn balance, amount -> balance + amount end

    # {_value, updated_balance} =
    #   Map.get_and_update(state, :balance, fn balance ->
    #     {balance, update_balance.(balance, amount)}
    #   end)

    # {:noreply, updated_balance}

    {:noreply, get_updated_balance(state, amount, &(&1 + &2))}
  end

  def handle_cast({:withdraw, amount}, state) do
    {:noreply, get_updated_balance(state, amount, &(&1 - &2))}
  end

  # private
  defp get_updated_balance(state, amount, calculate_balance) do
    {_value, updated_balance} =
      Map.get_and_update(state, :balance, fn balance ->
        {balance, calculate_balance.(balance, amount)}
      end)

    updated_balance
  end
end
