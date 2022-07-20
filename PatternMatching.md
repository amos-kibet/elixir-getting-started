## Pattern Matching

- A pattern (the left side) is matched if the values (the right side) have the same structure and if each term in the pattern can be matched to the corresponding term in the values.
- A literal term in the pattern matches that exact value, and a variable in the pattern matches by taking on the corresponding value.

**Note:** When there is no match, and a `MatchError` is raised, the problem is on the right side (values) because it has failed to match a pre-coded/pre-existing pattern (left side).

### Examples

```elixir
iex(1)>a = 1
1

iex(2)>1 = a
1

iex(3)>2 = a
** (MatchError) no match of right hand side value: 1

iex(4)>list = [1,2,3]
[1,2,3]

iex(5)>[a,b,c] = list
[1,2,3]

iex(6)>a
1
```

```iex
iex(1)>list = [1,2,3]
[1,2,3]

iex(2)>[a,1,b] = list
** (MatchError) no match of right hand side value: [1,2,3]

iex(3)>[a,2,b] = list
[1,2,3]
```

### Ignoring a value with underscore (\_)

- Used if you want to ignore a value during pattern matching.

```elixir
iex(1)[1,_,_] = [1,2,3]
[1,2,3]

iex(2)[1,_,_] = [1,"cat","dog"]
[1, "cat", "dog"]
```

### Variables Bind Once (per Match)

Once a variable has been bound to a value in the matching process, it keeps that value for the remainder of the match.

```elixir
iex(1)>[a,a] = [1,1]
[1,1]

iex(2)>a
1

iex(3)>[b,b]  = [1,2]
** (MatchError) no match of right hand side value: [1, 2]
```

However, a variable can be bound to a new value in a subsequent match, and its current value does not participate in the new match.

```elixir
iex(1)>a = 1
1

iex(2)>[1,a,3] = [1,2,3]
[1,2,3]

iex(3)>a
2
```

You can as well force Elixir to use the existing value of the variable in the pattern by prefixing the variable with a `^`, called the `pin operator`.

```elixir
iex(1)>a = 1
1

iex(2)>[1,^a,3] = [1,2,3]
** (MatchError) no match of right hand side value: [1, 2, 3]

iex(3)>a
1
```
