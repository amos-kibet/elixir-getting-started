# Phoenix Sockets

`Phoenix.Socket` is a `WebSocket` implementation that multiplexes messages over Phoenix channels.

Once connected to a socket, incoming and outgoing events are routed to channels.

Events are routed by topic to channels:

```elixir
channel "room:lobby", MyAppWeb.LobbyChannel
```

## Socket Behaviour

Socket handlers are mounted in the Endpoint and must define two callbacks:

- `connect/3` - receives the socket params, connection info if any, and authenticates the connection. Must return a `Phoenix.Socket` struct, often with custom assigns

- `id/1` - receives the socket returned by `connect/3` and returns the id of this connection as a string. The id is used to identify socket connections, often to a particular user, allowing us to force disconnections. For sockets requiring no authentication, `nil` can be returned

Example:

```elixir

defmodule MyAppWeb.UserSocket do
  use Phoenix.Socket

  channel "room:*", MyAppWeb.RoomChannel

  def connect(params, socket, _connect_info) do
    {:ok, assign(socket, :user_id, params["user_id"])}
  end

  def id(socket), do: "users_socket:#{socket.assigns.user_id}"
end

# Disconnect all user's socket connections and their multiplexed channels
MyAppWeb.Endpoint.broadcast("users_socket:" <> user.id, "disconnect", %{})
```

## Socket Fields:

- `:id` - The string id of the socket
- `:assigns` - The map of socket assigns, default: `%{}`
- `:channel` - The current channel module
- `:channel_pid` - The channel pid
- `:endpoint` - The endpoint module where this socket originated, for example: `MyAppWeb.Endpoint`
- `:handler` - The socket module where this socket originated, for example: `MyAppWeb.UserSocket`
- `:joined` - If the socket has effectively joined the channel
- `:join_ref` - The ref sent by the client when joining
- `:ref` - The latest ref sent by the client
- `:pubsub_server` - The registered name of the socket's pubsub server
- `:topic` - The string topic, e.g. `"room:123"`
- `:transport` - An identifier for the transport, used for logging
- `:transport_pid` - The pid of the socket's transport process
- `:serializer` - The serializer for socket messages

**Other Accepted Options**:

- `:log` - the default level to log socket actions. Defaults to `:info`. May be set to `false` to disable it
- `:partitions` - each channel is spawned under a supervisor. This option controls how many supervisors will be spawned to handle channels. Defaults to the number of cores.

## Garbage Collection

It's possible to force garbage collection in the transport process after processing large messages. For example, to trigger such from your channels, run:

```elixir
send(socket.transport_pid, :garbage_collect)
```

Alternatively, you can configure your endpoint socket to trigger more fullsweep garbage collections more frequently, by setting the `:fullsweep_after` option for websockets. The example below sets forces garbage collection to be as frequent as possible.

```elixir
  socket "/socket", MyAppWeb.UserSocket,
    websocket: [fullsweep_after: 0],
    longpoll: false
```
