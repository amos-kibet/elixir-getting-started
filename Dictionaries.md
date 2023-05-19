## Dictionaries (Maps, Keyword Lists, Sets, and Structs)

A dictionary is a data type that associates keys with values.

### Keyword Lists

- Used in the context of options passed to functions.
- Keys must be atoms
- Keys are ordered, as specified by the developer
- Keys can be given more than once
- Elixir ships with `Keyword` module, that has some built-in functions.

Keyword List Built-in Function:

- `Keyword.get/2` => pass the keyword list as arg1, and key as arg2. Returns the first value of the passed key.

  - ```elixir
    iex(1)> kw = [name: "Amos", name: "Kibet", age: "Undefined", profession: "programmer", profession: "electrician"]
      [
      name: "Amos",
      name: "Kibet",
      age: "Undefined",
      profession: "programmer",
      profession: "electrician"
    ]

    iex(2)> Keyword.get(kw, :name)
    "Amos" # Note it does not return "Kibet"
    ```

- `Keyword.get_values/2` => pass the keyword list as arg1, and key as arg2. Returns all values of the passed key.

  - ```elixir
    iex(1)> Keyword.get_values(kw, :name)
    ["Amos", "Kibet"]
    ```

- `Keyword.put_new(keywords, key, value)` => Adds the specified `value` with the specified `key` if the key does not already exist. If the key exists, its value remains unchanged.

  - ```elixir
    iex(9)> Keyword.put_new(kw, :name, "Kirui")
    [
      name: "Amos",
      name: "Kibet",
      age: "Undefined",
      profession: "programmer",
      profession: "electrician"
    ] # Note "Kirui" was not added

    iex(10)> Keyword.put_new(kw, :hobby, "None")
    [
      hobby: "None",
      name: "Amos",
      name: "Kibet",
      age: "Undefined",
      profession: "programmer",
      profession: "electrician"
    ]
    ```

- `Keyword.delete(keywords, key) => Deletes the entries in the keyword list under the specified `key`. If the key does not exist, it returns the keyword list unchanged. Use `delete_first/2` to delete just the first entry in case of duplicate keys.

### Maps

- Whenever you need a key-value store, maps are the "go-to" data structure in Elixir.

- Maps allow any values as keys

- Map's keys do not follow any ordering

- A map is created using the `%{}` syntax:

`map = %{:a => 1, 2 => :b}`

### Exploring Map API With Examples

```elixir
iex(1)> map = %{name: "Amos", age: "Undefined", profession: "Programmer", hobby: "None"}
%{
  age: "Undefined",
  hobby: "Undefined",
  name: "Amos",
  profession: "Programmer"
}

iex(2)> Map.keys map # or Map.keys(map)
[:age, :hobby, :name, :profession]

iex(3)> Map.values map
["Undefined", "Undefined", "Amos", "Programmer"]

iex(4)> map[:name]
"Amos"

iex(5)> map.name
"Amos"

iex(6)> map1 = Map.drop map, [:age, :hobby]
%{name: "Amos", profession: "Programmer"}

iex(7)> map2 = Map.put map, :profession, "Electrician"
%{age: "Undefined", hobby: "None", name: "Amos", profession: "Electrician"}

iex(8)> map2.profession
"Electrician" # Note :profession value has been overriden in the new map, but unchanged in the old map. See below:

iex(9)> map.profession
"Programmer"

iex(10)> Map.has_key? map, :name
true

iex(11)> Map.has_key? map, :married
false
```

### Structs

They are extensions built on top of maps that provide compile-time checks and default values.

### Defining Structs

`defstruct` construct is used to defined a struct.

```elixir
defmodule User do
  defstruct name: "Amos", age: "Undefined" # or name: "", age: ""(for str)/age(for int)
end
```

Structs take the name of the module they are defined in. In the example above, we defined a struct named `%User{}`.

We can now create `%User{}` structs by using a syntax similar to the one used to create maps.

```elixir
iex(1)> Amos = %User{}
%User{age: "Undefined", name: "Amos"}

iex(2)> Kibet = %User{name: "Kibet", age: 100}
%User{age: 100, name: "Kibet"}
```

The above code will generate two different structs with values -

```elixir
%User{age: "Undefined", name: "Amos"}
%User{age: 100, name: "Kibet"}
```

Structs provide compile-time guarantees that only the fields (and all of them) defined through `defstruct` will be allowed to exist in the struct. So you cannot define your own fields once you have created the struct in the module.

### Accessing and Updating Structs

```elixir
iex(3)> new_Amos = %User{}
# new_Amos right now is: %User{age: "Undefined", name: "Amos"}

# To access name and age of new_Amos,
# IO.puts(new_Amos.name) => "Amos
# IO.puts(new_Amos.age) => "Undefined"
```

To update a value in a struct:

```elixir
iex(4)> Kirui = %{new_Amos | name: "Kirui"}
%{age: "Undefined", name: "Kirui"}
```

`Tip:` The reason why structs are wrapped in a module is because you likely want to add struct-specific behavior.

## Nested Dictionary-access Functions On Structs

`put_in`: A macro that is useful in nested structs. Example:

```elixir
iex(1)> p1 = %Profile{age: "Undefined", user: %Name{first_name: "Amos", last_name: "Kibet"}}
%Profile{age: "Undefined", user: %Name{first_name: "Amos", last_name: "Kibet"}}

iex(2)> put_in(p1.user.last_name, "Kirui") # replaces "Kibet" with "Kirui"
%Profile{age: "Undefined", user: %Name{first_name: "Amos", last_name: "Kirui"}}
```

`update_in`: Lets us apply a function to a value in a structure. Example

```elixir
iex(3)> update_in(p1.user.first_name, &("Mr. " <> &1))
%Profile{age: "Undefined", user: %Name{first_name: "Mr. Amos", last_name: "Kibet"}}
```

Other functions (macros) are `get_in` and `get_and_update_in`.

### More Examples On Structs

```elixir
defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end
```

### Sets

Sets are implemented using the module `MapSet`.

```elixir
iex()> set1 = 1..5 |> Enum.into(MapSet.new)
#MapSet<[1, 2, 3, 4, 5]>

iex()> set2 = 3..8 |> Enum.into(MapSet.new)
#MapSet<[3, 4, 5, 6, 7, 8]>

iex()> MapSet.member? set1, 3
true

iex()> MapSet.union set1, set2
#MapSet<[1, 2, 3, 4, 5, 6, 7, 8]>

iex()> MapSet.difference set1, set2
#MapSet<[1, 2]>

iex()> MapSet.difference set2, set1
#MapSet<[6, 7, 8]>

iex()> MapSet.intersection set2, set1
#MapSet<[3, 4, 5]>
```
