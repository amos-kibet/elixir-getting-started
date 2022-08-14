## Enum and Stream - Used for Processing Collections

These modules provide a lot of iteration functions that are used on collections

### Enum Module

It is used to iterate, filter, combine, split, and manipulate collections.
Here are some common tasks:

```elixir
# convert any collection into a list
iex()> list = Enum.to_list 1..5
[1, 2, 3, 4, 5]

# concatenate collections
iex()> Enum.concat([1, 2, 3, 4], [5, 6, 7, 8])
[1, 2, 3, 4, 5, 6, 7, 8]

# create a collection whose elements are some function of the original
iex()> Enum.map(list, &(&1 * 10))
[10, 20, 30, 40]

# select elements by position or criteria
iex()> Enum.at(10..20, 3)
13

iex()> Enum.at(10..20, 20)
nil

iex()> Enum.at(10..20, 20, :no_one_here)
:no_one_here

iex()> Enum.filter(list, &(&1 > 2))
[3, 4, 5]

iex()> require Integer # to get access to is_even function
Integer

iex()> Enum.filter(list, &Integer.is_even/1)
[2, 4]

iex()> Enum.reject(list, &Integer.is_even/1)
[1, 3, 5]

# sort and compare elements
iex()> string_list = ["there", "was", "a", "crooked", "man"]
["there", "was", "a", "crooked", "man"]

iex()> Enum.sort(string_list)
["a", "crooked", "man", "there", "was"]

iex()> Enum.sort(string_list, &(String.length(&1) <= String.length(&2))) # Note: it is important to use <= instead of < to make the comparison stable
["a", "was", "man", "there", "crooked"]

iex()> Enum.max(string_list)
"was" # I don't understand why this result. Orders the elements by erlang's structure (read more)

iex()> Enum.max_by(string_length, &String.length/1)
"crooked"

# split a collection
iex()> Enum.take(list, 3)
[1, 2, 3]

iex()> Enum.take_every(list, 2)
[1, 3, 5]

iex()> Enum.take_while(list, &(&1 < 4))
[1, 2, 3]

iex()> Enum.split(list, 3)
{[1, 2, 3], [4, 5]}

iex()> Enum.split_while(list, &(&1 <4))
{[1, 2, 3], [4, 5]}

# join a collection
iex()> Enum.join(list)
"12345" # becomes string/binary

iex()> Enum.join(list, ",")
"1,2,3,4,5"

#predicate operations
iex()> Enum.all?(list, &(&1 < 4))
false

iex()> Enum.any?(list, &(&1 < 4))
true

iex()> Enum.member?(list, 4)
true

iex()> Enum.empty?(list)
false

# merge collections
iex()> Enum.zip(list, [:a, :b, :c])
[{1, :a}, {2, :b}, {3, :c}]

iex()> Enum.with_index(["once", "upon", "a", "time"])
[{"once", 0}, {"upon", 1}, {"a", 2}, {"time", 3}]

# fold elements into a single value
iex()> Enum.reduce(1..100, &(&1 + &2))
5050

iex()> Enum.reduce(["now", "is", "the", "time"], fn word, longest ->
              if String.length(word) > String.length(longest) do
                word
              else
                longest
              end
        end)
"time"
iex()> Enum.reduce(["now", "is", "the", "time"], 0, fn word, longest ->
              if String.length(word) > longest, do: String.length(word)
              else: longest
        end)
4
```
