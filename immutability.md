## Immutability in Elixir

In OOP, data is mutable.In the example below, array has some initial value. After performing some operations on the array, the programmer is never sure what data the array contains.

```python
array = [1,2,3]
do_something_with(array)
print(array)
# Most likely not [1,2,3]
```

In Elixir, data is immutable. Once a variable references a list such as [1,2,3], you know it will always reference those same values (until you rebind the variable).

To perform operations on data, Elixir copies the original data and operate on the copy. The original data remains unchanged.

```elixir
iex(1)>name = "elixir"
"elixir"

iex(2)>cap_name = String.capitalize name
"Elixir"

iex(3)>name
"elixir"
```
