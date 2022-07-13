## Named Functions

Named functions must be written inside modules

### Example

```elixir
defmodule Times do
  def double(n) do
    n * 2
  end
end
```

### Use of Guard Clauses

They are predicates that are attached to a function definition, for decision making in calling different implementations of a function.

```elixir
defmodule Guard do
  def what_is(x) when is_number(x) do
    IO.puts "#{x} is a number"
  end
  def what_is(x) when is_list(x) do
    IO.puts "#{inspect(x)} is a list"
  end
  def what_is(x) when is_atom(x) do
    IO.puts "#{x} is an atom"
  end
end

Guard.what_is(99) # => 99 is a number
Guard.what_is(:cat) # => cat is an atom
Guard.what_is([1,2,3]) # => [1,2,3] is a list
```

### Use of Pipe Operator (|>)

Look at this code:

```
people = DB.find_customers
orders = Orders.for_customers(people)
tax = sales_tax(orders, 2018)
filing = prepare_filing(tax)
```

The above code can be converted to be more readable using pipe oerator, as below:

```elixir
filing = DB.find_customers
            |> Orders.for_customers
            |> sales_tax(2018)
            |> prepare_filing
```

The `|>` operator takes the result of the expression to its left and inserts it as the first parameter of the function invocation to its right.

`val |> f(a, b)` is basically the same as calling `f(val, a, b)`

and,

```elixir
list
|> sales_tax(2018)
|> prepare_filing
```

is the same as:
`prepare_filing(sales_tax(list, 2018))`

## Modules

Modules encapsulate named functions. They also act as wrappers for macros, structs, protocols, and other modules.

### Directives for Modules

They are lexically scoped. This means a directive in a module definition takes effect from the place you wrote it until the end of the module; a directive in a function definition runs to the end of the function.

They include:

- The `import directive` => brings a module's functions and/or macros into the current scope.

Syntax:

`import Module: [, only:except: ]`

Example:
`import List, only: [ flatten: 1, duplicate: 2 ]`

- The `alias directive` => creates an alias for a module, cuts down on typing.

Example:

```elixir
defmodule Example do
  def compile_and_go(source) do
    alias My.Other.Module.Parser, as: Parser
    alias My.Other.Module.Runner, as: Runner
    source
    |> Parser.parse()
    |> Runner.run()
  end
end
```

We can abbreviate these `alias` directives to

```elixir
alias My.Other.Module.Parser
alias My.Other.Module.Runner
```

because the `as:` parameters default to the last part of the module name. We could even further abbreviate them as shown:

```elixir
alias My.Other.Module.{Parse, Runner}
```

- The `require directive` => You require a module if you want to use an t macros it defines. This ensures that the macro definitions are available when your code is compiled.

### Module Attributes

These are the metadata/attributes of a module.
These attributes are not variables in the conventional sense. Use them for configuration and metadata only.
They are the equivalent of constants in Java.

Syntax: `@name value`

Example"

```elixir
defmodule Example do
  @author "Amos Kibet"
  def get_author do
    @author
  end
end

IO.puts "Example was written by #{Example.get_author}"
```

`Q`: Explain more on Default Parameters passed to named functions.
