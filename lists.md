## Lists

A list in Elixir is a linked data structure.
It can either be empty or consist of a head and a tail. The head contains a value and the tail is itself a list.

Elixir lists are easy to traverse linearly, but expensive to acces in random order.

### Example Operations on Lists

```elixir
iex(1)>[1,2,3] ++ [4,5,6] # concatenation
[1,2,3,4,5,6]

iex(2)>[1,2,3,4] -- [2,3] # difference
[1,4]

iex(3)>1 in [1,2,3] # membership
true

iex(4)>"amos" in [1,2,3]
false
```

### Keyword Lists

Because we often need simple lists of key/value pairs, Elixir gives us a shortcut. If we write:

`[name: "Amos", city: "Nairobi", likes: "Programming"] `

Elixir converts it into a list of two-value tuples:

`[{:name, "Amos"}, {:city, "Nairobi"}, {:likes, "Programming"}]`
