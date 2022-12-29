# Phoenix Channels

Clients connect to the server using some transport, like **WebSocket**.
Once connected, they join one or more topics. For example, to interact with a public chat room, clients may join a topic called `public_chat`,
and to receive updates from a product wit ID 7, they may join a topic
called `product_updates:7`.

Clients push messages to the topics they've joined, and can also receive messages from them. Channel servers can also send and receive messages from their connected clients.

Servers can also broadcast messages to all their connected clients. Example use case: updating comments UI with new comment

To start communicating, a client connects to a node (a Phoenix server) using `WebSocket` or `long polling`, and joins one or more channels using
that single network connection. One channel server lightweight process is created per client, per topic. Each channel holds onto the `%Phoenix.Socket{}` and can maintain any state it needs within its `socket.assigns`.

Once the connection is established, each incoming message from a client is routed, based on its topic, to the correct channel server.

The client connects to a Phoenix server via socket connection as shown below:

```js
let socket = new Socket("/socket", { params: { token: window.userToken } });
```

On the server, Phoenix will invoke:

```elixir
MyAppWeb.UserSocket.connect/2
```

where `UserSocket` is the module that implements Phoenix socket connection, and `connect/2` is the socket connection API that must be implemented in the module.

## Channel Routes

Channel routes match on the topic string and dispatch matching requests to the given Channel module.

The star character `*` acts as a wildcard matcher, so in the following example route, requests for `room:lobby` and `room:123` would both be dispatched to the `RoomChannel`. In your UserSocket, you would have:

```elixir
channel "room:*", MyAppWeb.RoomChannel
```

## Channels

Channels handle events from clients, so they are similar to Controllers, but there are two key differences. Channel events can go both directions - incoming and outgoing. Channel connections also persist beyond a single request/response cycle. Channels are the highest level abstraction for real-time communication components in Phoenix.

Each Channel will implement one or more clauses of each of these four callback functions - `join/3`, `terminate/2`, `handle_in/3`, and `handle_out/3`.

## Messages

The `Phoenix.Socket.Message` module defines a struct with the following keys which denotes a valid message:

- `topic` - The string topic or `"topic:subtopic"` pair namespace, such as `"messages"`, or `"messages:123"`
- `event` - The string event name, e.g. `"phx_join"`
- `payload` - The message payload
- `ref` - The unique string ref

## Fault Tolerance & Reliebilty Guarantees

**Handling Reconnection**:

Clients subscribe to topics, and Phoenix stores those subscriptions in an in-memory ETS table. If a channel crashes, the clients will need to reconnect to the topics they had previously subscribed to. Fortunately, the Phoenix JavaScript client knows how to do this. The server will notify all the clients of the crash. This will trigger each client's `Channel.onError` callback. The clients will attempt to reconnect to the server using an exponential backoff strategy. Once they reconnect, they'll attempt to rejoin the topics they had previously subscribed to. If they are successful, they'll start receiving messages from those topics as before.

**Resending Client Messages**:

Channel clients queue outgoing messages into a PushBuffer, and send them to the server when there is a connection. If no connection is available, the client holds on to the messages until it can establish a new connection. With no connection, the client will hold the messages in memory until it establishes a connection, or until it receives a timeout event. The default timeout is set to 5000 milliseconds. The client won't persist the messages in the browser's local storage, so if the browser tab closes, the messages will be gone.

**Resending Server Messages**:

Phoenix uses an at-most-once strategy when sending messages to clients. If the client is offline and misses the message, Phoenix won't resend it. Phoenix doesn't persist messages on the server. If the server restarts, unsent messages will be gone. If our application needs stronger guarantees around message delivery, we'll need to write that code ourselves. Common approaches involve persisting messages on the server and having clients request missing messages.
