defmodule Genserver.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Genserver.Router, []},
      {Genserver.ApiHandler, []}
    ]

    opts = [strategy: :one_for_one, name: Genserver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
