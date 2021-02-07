defmodule GeoTasks.Models.User do
  @moduledoc """
  Describe user entity
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias GeoTasks.Models.TaskUser

  @cast_fields [
    :name,
    :role
  ]
  @required_fields [
    :name,
    :role
  ]
  @type t :: %__MODULE__{}

  @allowed_roles ["driver", "manager"]

  schema "users" do
    field :name, :string
    field :role, :string

    has_many(:task_users, TaskUser, on_delete: :delete_all)
    has_many(:tasks, through: [:task_users, :user])

    timestamps()
  end

  def allowed_rules, do: @allowed_roles

  def changeset(entity \\ %__MODULE__{}, attrs) do
    entity
    |> cast(attrs, @cast_fields, [])
    |> validate_required(@required_fields)
    |> validate_inclusion(:role, @allowed_roles)
  end
end