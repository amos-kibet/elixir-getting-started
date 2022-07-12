## Anonymous Functions

Created using the `fn` keyword:

```elixir
fn
  parameter-list -> body
end

# or
fn parameter-list -> body end
```

At its simplest, a function has a parameter list and a body, separated by a `->`.

For example, the following defines a function, binding it to the variable `sum`, and then calls it:

```elixir
iex(1)> sum = fn (a, b) -> a + b end
#Function<43.65746770/2 in :erl_eval.expr/5>

iex(2)> sum.(1, 2)
3
```

The dot (.) in the function invokation above indicates function call. WIth named functions, we don't use a dot for function calls.

### Using Pattern Matching to reverse order of elements in a tuple

```elixir
iex(1)> swap = fn {a, b} -> {b, a} end
#Function<44.65766473/1 in :erl_eval.expr/5>

swap.({1, 2})
{2, 1}
```

`Q`: How do you solve this:

```elixir
pair_tuple_to_list.({1234,5678}) # => [1234,5678]
```

` Q2`: Write a function prefix that takes a string. It should return a new function that takes a second string. When that second function is called, it will return a string containing the first string, a space, and the second string.

Example:

```elixir
iex(1)> mrs = prefix.("Mrs")
#Function<erl_eval.6.82930912>

iex(2)> mrs.("Smith")
"Mrs Smith"

iex(3)> prefix.("Elixir").("Rocks")
"Elixir Rocks"
```

### Passing Anonymous Functions as arguments

Functions are just values, so we can pass them to other functions

```elixir
iex(1)> times_2 = fn n -> n * 2 end
#Function<44.65746770/1 in :erl_eval.expr/5>

iex(2)> apply = fn (fun, value) -> fun.(value) end
#Function<43.65746770/2 in :erl_eval.expr/5>

iex(3)> apply.(times_2, 6)
12
```

### The `&` Operator

COnverts the expression that follows inot a function.
Inside that expression, the placeholders &1, &2, and so on correspond to the first, second, and subsequent parameters of the function.

```
&(&1 + &2) === fn p1, p2 -> p1 + p2 end
```

### Usecases

These functions are used when we want to pass a function as an argument to another function.
Enum module uses anonymous functions.

### Example Problem

`Q`: Write an anonymous function that takes 3 arguments as follows:
arg1 => a number, say x
arg2 => an anonymous function that takes the result of arg3 and multiplies it by 2
arg3 => an anonymous function that takes arg1 and squares it

```elixir
iex(1)> fun = fn (x, fun1, fun2) -> fun1.(fun2.(x)) end
#Function<42.65746770/3 in :erl_eval.expr/5>

iex(2)> fun2 = fn (x) -> x * x end
#Function<44.65746770/1 in :erl_eval.expr/5>

iex(3)> fun1 = fn (fun2) -> fun2 * 2 end
#Function<44.65746770/1 in :erl_eval.expr/5>

# calling the first function with the three arguments
iex(4)> fun.(5, fun1, fun2)
50
```
