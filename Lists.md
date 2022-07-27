## Lists

A list in Elixir is a linked data structure.
It can either be empty or consist of a head and a tail. The head contains a value and the tail is itself a list.

Lists in Elixir are effectively linked lists, which means they are internally represented in pairs containing the head and the tail of a list:

```elixir
iex(1)> [head | tail] = [1, 2, 3]
[1, 2, 3]

iex(2)> head
1

iex(3)> tail
[2, 3]
```

Elixir lists are easy to traverse linearly, but expensive to access in random order. Access takes linear time.

From the definition, list is constructed recursively, as shown below:

```
empty list => []
add 1 to the empty list => [1 | []] , here, a 'pipe' (|) is used to separate the head and tail of the list
add 2 => [2 | [1 |[]]
add 3 => [3 | [2 | [1 | []]]]
the resulting list will look like this => [3, 2, 1]
```

`[3, 2, 1]` is just syntactic sugar. Internally, ELixir represents such a list as `[3 | [2 | [1 | []]]]`

### Example1: Writing the list-length algorithm

```elixir
# mylist.exs
defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail) # undescore head to avoid unused variable warning
end

# iex
iex(1)> c "mylist.exs"
[MyList]

iex(2)> MyList.len(0)
0

iex(3)> MyList.len([1,2,3,4,5])
5

iex(4)> MyList.len(["cat", "dog"])
2
```

### Example 2: Writing a function that squares elements of a list

```elixir
defmodule MyList do
  def square([]), do: []
  def square([head|tail]), do: [head*head | square(tail)]
end

# iex
iex(1)> c "my_list.exs"
[MyList]

iex(2)> MyList.square([])
[]

iex(3)> MyList.square([1, 2, 3])
[1, 4, 9]
```

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

iex(5)>[4 | [3, 2, 1]] # prepending
[4, 3, 2, 1]

iex(6)>[3, 2, 1] ++ [4] # appending
[3, 2, 1, 4]
```

### Built-in Kernel Functions

`Q`: Write a mapsum function that takes a list and a function. It applies the function to each element of the list and then sums the result, so
`iex> MyList.mapsum [1, 2, 3], &(&1 * &2) # results to 14`

### Keyword Lists

Because we often need simple lists of key/value pairs, Elixir gives us a shortcut. If we write:

`[name: "Amos", city: "Nairobi", likes: "Programming"] `

Elixir converts it internally into a list of two-value tuples, with the first term being an atom:

`[{:name, "Amos"}, {:city, "Nairobi"}, {:likes, "Programming"}]`
