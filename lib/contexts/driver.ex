defmodule GeoTasks.Contexts.Driver do
  @moduledoc """
  Contains functions to interact with database for Driver
  """

  alias GeoTasks.Models.{Task, TaskUser, User}
  alias GeoTasks.Repo

  @maximum_radius 0.1

  @spec near_tasks(float, float, float) :: list(Task)
  def near_tasks(latitude, longitude, maximum_radium \\ @maximum_radius) do
    []
  end

  @spec assign_task(integer, integer) :: {:ok, TaskUser.t} | {:error, binary}
  def assign_task(task_id, user_id) do
    {:ok, %TaskUser{}}
  end

  @spec complete_task(integer, integer) :: {:ok, TaskUser.t} | {:error, binary}
  def complete_task(task_id, user_id) do
    {:ok, %TaskUser{}}
  end
end