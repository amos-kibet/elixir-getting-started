## Data Types

### Built-in Types

- Value types:

  - Arbitrary-sized integers
  - Floating-point numbers
  - Atoms
  - Ranges
  - Regular expressions

- System types:

  - PIDs and ports
  - References

- Collection types:

  - Tuples
  - Lists
  - Maps
  - Binaries

These data types belong to modules with their names same as the data type names.
These are the modules that handle Elixir built-in data types:

- `Atom` => Literal constants

- `Float` => numbers with floating point precision

- `Function` => a reference to code chunk, created with the `fn/1` special form

- `Integer` => whole numbers (not fractions)

- `List` => collections of a variable number of elements (linked lists)

- `Map` => collections of key-value pairs

- `Process` => light-weight threads of execution

- `Port` => mechanisms to interact with the external world

- `Tuple` => collections of a fixed number of elements

There are two data types without an accompanying module:

- `Bitstrings` => a sequence of bits, created with `Kernel.SpecialForms.<<>>/1
- `Reference`=> a unique value in the runtime system, created with`make_ref/0`

Elixir also provides other data types that are built on top of the types listed above. Some of them are:

- `Date` => year-month-day structs in a given calendar
- `DateTime` => date and time with time zone in a given calendar
- `Exception` => data raised from errors and unexpected scenarios
- `MapSet` => unordered collections of unique elements
- `NaiveDateTime` => date and time without time zone in a given calendar
- `Keyword` => list of two-element tuples, often representing optional values
- `Range` => inclusive ranges between two integers
- `Regex` => regular expressions
- `String` => UTF-8 encoded binaries representing characters
- `Time` => hour:minute:second structs in a given calendar
- `URI` => representation of URIs that identify resources
- `Version` => representation of versions and requirements
