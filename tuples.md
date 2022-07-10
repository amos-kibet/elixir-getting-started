## Tuples

A tuple is an ordered collection of values. As with all Elixir data structures, once created, a tuple cannot be modified.

### Examples

`{1, 2}, {:ok, 42, "next"}, {:error, :enoent}`

A typical Elixir tuple has two to four elements, more than that and you'll probably want to look at maps, or structs.

You can use tuples in pattern matching:

```elixir
iex(1)>{status, count, action} = {:ok, 42, "next"}
{:ok, 42, "next"}

iex(2)>status
:ok

iex(3)>count
42

iex(4)>action
"next"
```
