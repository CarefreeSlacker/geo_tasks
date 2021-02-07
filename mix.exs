defmodule GeoTasks.MixProject do
  use Mix.Project

  def project do
    [
      app: :geo_tasks,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      mod: {GeoTasks, []},
      extra_applications: extra_applications(Mix.env())
    ]
  end

  def extra_applications(:test) do
    [:ex_machina] ++ extra_applications(:regular)
  end

  def extra_applications(_) do
    [:logger]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Web-Server
      {:plug_cowboy, "~> 2.0"},
      # Database
      {:ecto, "~> 3.5.5"},
      {:ecto_sql, "~> 3.5.3"},
      {:postgrex, ">= 0.0.0"},
      # Tools
      {:poison, "~> 4.0.1"},
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false},
      # Testing
      {:ex_machina, "~> 2.4", only: :test}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run apps/cti_omni/priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"]
    ]
  end
end
