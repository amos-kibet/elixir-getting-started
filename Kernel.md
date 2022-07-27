## Kernel

It is Elixir's default environment. It mainly consists of:

- basic language primitives, such as arithmetic operators, spawning of processes, data type handling, and others.
- macros for control-flow and defining new functionality (modules, functions, etc)
- guard checks for augmented pattern matching.

You can invoke `Kernel` functions and macros anywhere in Elixir code without the use of the `Kernel.` prefix; they are automatically imported.

Example:

```elixir
iex(1)> is_number(13)
true
```

If you don't want to import a function or macro from `Kernel`, use the `:except` option and then list the function/macro by arity:
`import Kernel, except: [if: 2, unless: 2]`

### System Modules

These are modules that interface with the underlying system, such as:

- [IO](https://hexdocs.pm/elixir/1.13/IO.html) => handles input and output
- [File](https://hexdocs.pm/elixir/1.13/File.html) => interacts with the underlying file system
- [Path](https://hexdocs.pm/elixir/1.13/Path.html) => manipulates file system paths
- [System](https://hexdocs.pm/elixir/1.13/System.html) => reads and writes system information

### Process-based and application-centric functionality

The following modules build on top of processes to provide concurrency, fault-tolerance, and more.

- [Agent](https://hexdocs.pm/elixir/1.13/Agent.html) => a process that encapsulates mutable state
- [Application](https://hexdocs.pm/elixir/1.13/Application.html) => functions for starting, stopping and configuring applications
- [GenServer](https://hexdocs.pm/elixir/1.13/GenServer.html) => a generic client-server API
- [Registry](https://hexdocs.pm/elixir/1.13/Registry.html) => a key-value process-based storage
- [Supervisor](https://hexdocs.pm/elixir/1.13/Supervisor.html) => a process that is responsible for starting, supervising and shutting down other processes
- [Task](https://hexdocs.pm/elixir/1.13/Task.html) => a process that performs computations
- [Task.Supervisor](https://hexdocs.pm/elixir/1.13/Task.Supervisor.html) => a supervisor for managing tasks exclusively
