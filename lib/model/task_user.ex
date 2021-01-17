defmodule GeoTasks.Models.TaskUser do
  @moduledoc """
  Describe user task relation. Contains data if task completed
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias GeoTasks.Models.{Task, User}

  @cast_fields [
    :finished,
    :user_id,
    :task_id
  ]
  @required_fields [
    :finished,
    :user_id,
    :task_id
  ]
  @type t :: %__MODULE__{}

  schema "tasks_users" do
    field :finished, :boolean, default: false

    belongs_to(:task, Task)
    belongs_to(:user, User)

    timestamps()
  end

  def changeset(entity \\ %__MODULE__{}, attrs) do
    entity
    |> cast(attrs, @cast_fields, [])
    |> validate_required(@required_fields)
  end
end