defmodule GeoTasks.Fixtures do
  @moduledoc """
  Contains logic for initializing database entities
  """

  alias GeoTasks.Contexts.Database

  def task_fixture(attrs) do
    initialize_resource(attrs, &Database.create_task/1)
  end

  def user_fixture(attrs) do
    initialize_resource(attrs, &Database.create_user/1)
  end

  def task_user_fixture(attrs) do
    initialize_resource(attrs, &Database.create_task_user/1)
  end

  defp initialize_resource(attrs, initialize_function) do
    case initialize_function.(attrs) do
      {:ok, resource} ->
        resource

      {:error, changeset} ->
        changeset
    end
  end
end