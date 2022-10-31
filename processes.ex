defmodule SimpleProcess do
  @moduledoc """
  Illustrates how one can spawn processes, and how messages can be passed between process
  """
  @name :simple_process

  @doc """
  sends a message
  """
#   def send_message do
#     pid = spawn(__MODULE__, :receive_message, [])
#     Process.register(pid, @name)
#     send(@name, :hell)
#   end

#   @doc """
#   Receives a message
#   """
#   def receive_message do
#     receive do
#       :hello -> IO.puts("Received a hello message")
#       other -> IO.puts("Received the message: #{inspect(other)}")
#     end
#   end
# end


# defmodule Math do
#   @moduledoc """
#   Does arithmetic operations through sending & receiving messages across processes
#   """

#   @doc """
#   Receives message & then sends a response in form of arithmetic operation
#   """
#   def add do
#     receive do
#       senders_pid ->
#         send(senders_pid, a + b)
#     end
#   end

#   @doc """
#   Sends a message with arithmetic operation & awaits for message
#   """
#   def double(n) do
#     spawn(Math, :add, [n,n])
#     |> send(self())

#     receive do
#       doubled ->
#         doubled
#     end
#   end
# end


defmodule Simple.Process do
  @moduledoc """
  A simple module that demonstrates use of processes
  """
  @receiver :receiver

  @doc """
  spawn & register a process on the message receiving function
  """
  def start_receiver do
    spawn(__MODULE__, :receive_message, [])
    |> Process.register(@receiver)
  end

  @doc """
  Sends a message to a receiver process
  """
  def send_message do
    send(@receiver, :hello)
  end

  @doc """
  Receives a message from a sender process
  """
  def receive_message do
    receive do
      :hello ->
        IO.puts "Hello there. Received your message!"
      other ->
        IO.puts "Received the message #{inspect(other)}"
      after
        1000 -> IO.puts("No message received, exciting now!")
      end
    end
  end
end
