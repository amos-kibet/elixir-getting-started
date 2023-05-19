defmodule Genserver.MixProject do
  use Mix.Project

  def project do
    [
      app: :genserver,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.6"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"},
      {:httpoison, "~> 1.4"},
      {:poison, "~> 4.0"},
      {:earmark, "~> 1.3", only: :dev},
      {:ex_doc, "~> 0.19.1", only: :dev}
    ]
  end
end
