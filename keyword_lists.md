## Keyword Lists

This is a special list in which all the elements are tuples containing two values and in which in the tuple, the first value must be an atom.

### More Definitions

A keyword list is a list that consists exclusively of two-element tuples.

The first element of these tuples is known as the key, and it must be an atom. The second element, known as the value, can be any term.

Keywords are mostly used to work with optional values.

Access is 0(n), same as a list

Since it's a list, you can use all the operations available for lists.

```elixir
iex(1)> list = [a: 1, b: 2]
[a: 1, b: 2]

iex(2)> list ++ [c: 3]
[a: 1, b: 2, c: 3]
```

You can read the values of a keyword list using the bracket syntax:

```elixir
iex(3)> list[:a]
1
```

In case of duplicate keys, values added to the front are the ones fetched:

```elixir
iex(4)> new_list = [a: 0] ++ list
[a: 0, a: 1, b: 2]

iex(5)> new_list[:a]
0

# List remains unchanged, as expected because of immutability
iex(6)> list
[a:1, b: 2]
```

### Recap

Keyword lists are important because they have three special characteristics:

- Keys must be atoms
- Keys are ordered, as specified by the developer
- Keys can be given more than once

### Example

```elixir
iex(1)> [{:name, "Kirui}, {:age, 25}]
[name: "Kirui", age: "25]
```
