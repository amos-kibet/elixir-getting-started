## Elixir Behaviours

Behaviours provide a way to:

- define a set of functions that have to be implemented by a module.
- ensure that a module implements all the functions in that set.

You can think of behaviours as interfaces in OOP.

Unlike Protocols, behaviours are independent of the type/data.

Behaviours enforce functions that have to implemented using the `@callback` attribute.

Every module implementing the behaviour must implement all the functions defined with the `@callback` attribute, and also function specifications like the ones used with `@spec` attribute.

**Example:**

```elixir
defmodule Parser do
  @doc """
  Parses a string.
  """
  @callback parse(String.t) :: {:ok, term} | {:error, atom}

  @doc """
  Lists all supported file extensions.
  """
  @callback extensions() :: [String.t]
end
```

### Implementing Behaviours

```elixir
defmodule JSONParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some json " <> str} # ... parse JSON

  @impl Parser
  def extensions, do: [".json"]
end
```

```elixir
defmodule CSVParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some csv " <> str} # ... parse CSV

  @impl Parser
  def extensions, do: [".csv"]
end
```

With the optional `@impl`, you can make sure that you are implementing the correct callbacks from the given behaviour in an explicit manner.
