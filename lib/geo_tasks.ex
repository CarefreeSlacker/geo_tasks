defmodule GeoTasks do
  @moduledoc """
  Documentation for GeoTasks.
  """
  use Application

  @doc """
   Loads configuration, starts all defined syncs, reports results
  """

  alias Plug.Cowboy

  def children do
    [
      GeoTasks.Repo,
      Cowboy.child_spec(
        scheme: :http,
        plug: GeoTasks.Router,
        options: [
          port: 4001
        ]
      )
    ]
  end

  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: GeoApi.Supervisor]
    Supervisor.start_link(children(), opts)
  end
end
