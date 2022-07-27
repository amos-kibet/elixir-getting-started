## Maps, Keyword Lists, Sets, and Structs

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

- `Keyword.get_values/2 => pass the keyword list as arg1, and key as arg2. Returns all values of the passed key.

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

iex(8)> map2.profession
"Electrician" # Note :profession value has been overriden in the new map, but unchanged in the old map. See below:

iex(9)> map.profession
"Programmer"

iex(10)> map.has_key? map, :name
true

iex(11)> Map.has_key? map, :married
false
```
