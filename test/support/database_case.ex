defmodule GeoTasks.DatabaseCase do
  @moduledoc """
  Contains logic to
  """

  use ExUnit.CaseTemplate
  alias Ecto.Adapters.SQL.Sandbox
  alias GeoTasks.Repo

  using do
    quote do
      import GeoTasks.Fixtures
      alias GeoTasks.Repo

      defp count_resource(resource) do
        Repo.aggregate(resource, :count, :id)
      end
    end
  end

  setup tags do
    :ok = Sandbox.checkout(Repo)

    unless tags[:async] do
      Sandbox.mode(Repo, {:shared, self()})
    end

    :ok
  end
end
