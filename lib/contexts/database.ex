defmodule GeoTasks.Contexts.Database do
  @moduledoc """
  Contains functions to interact with database for Driver
  """

  alias GeoTasks.Models.{Task, TaskUser, User}
  alias GeoTasks.Repo

  @maximum_radius 0.1

  @spec create_task(map) :: {:ok, Task.t} | {:error, Ecto.Changeset.t}
  def create_task(attrs) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @spec create_user(map) :: {:ok, User.t} | {:error, Ecto.Changeset.t}
  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @spec create_task_user(map) :: {:ok, TaskUser.t} | {:error, Ecto.Changeset.t}
  def create_task_user(attrs) do
    %TaskUser{}
    |> TaskUser.changeset(attrs)
    |> Repo.insert()
  end
end