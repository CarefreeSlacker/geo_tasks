defmodule GeoTasks.Contexts.Manager do
  @moduledoc """
  Contains functions to interact with database for Manager
  """

  alias GeoTasks.Models.{Task, TaskUser, User}
  alias GeoTasks.Repo

  @spec all_tasks :: list(Task)
  def all_tasks do
    []
  end

  @spec create_task(map) :: {:ok, Task} | {:error, Ecto.Changeset.t}
  def create_task(params) do
    {:ok, %Task{}}
  end
end