defmodule Genserver.ApiHandler do
  use GenServer

  def start_link(_default) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(args) do
    {:ok, args}
    |> IO.inspect(label: "[init/1]")
  end

  def terminate(reason, state) do
    IO.inspect(reason, label: "[termination reason]")
    IO.inspect(state, label: "[termination state]")

    :ok
  end

  # APIs
  def get_character(id_or_name) do
    GenServer.call(__MODULE__, {:get_character, id_or_name})
  end

  # callbacks
  # def handle_call(_term, _pid, state) do
  #   {:reply, [], state}

  #   IO.inspect(state, label: "[handle_call 26 state]")
  # end

  def handle_call({:get_character, id_or_name}, _pid, state) do
    {:ok, response} = get_character_request(id_or_name)
    {:reply, response, state}

    IO.inspect(state, label: "[handle_call 32 state]")
  end

  defp get_character_request(id_or_name) do
    url = api_route(id_or_name)

    case HTTPoison.get(url, [], []) do
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}

      {:ok, %HTTPoison.Response{body: body}} ->
        {:ok, body}
    end
  end

  defp api_route(id) do
    "https://anapioficeandfire.com/api/characters/#{id}"
  end
end
