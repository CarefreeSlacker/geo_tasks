defmodule GeoTasks.Models.Task do
  @moduledoc """
  Describe task entity
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias GeoTasks.Models.TaskUser

  @cast_fields [
    :pickup_lat,
    :pickup_lon,
    :delivery_lat,
    :delivery_lon
  ]
  @required_fields [
    :pickup_lat,
    :pickup_lon,
    :delivery_lat,
    :delivery_lon
  ]
  @type t :: %__MODULE__{}

  @max_lat 90
  @min_lat -90
  @max_lon 180
  @min_lon -180

  schema "tasks" do
    field :pickup_lat, :float
    field :pickup_lon, :float
    field :delivery_lat, :float
    field :delivery_lon, :float

    has_one(:task_user, TaskUser, on_delete: :delete_all)
    has_one(:user, through: [:task_user, :user])

    timestamps()
  end

  def changeset(entity \\ %__MODULE__{}, attrs) do
    entity
    |> cast(attrs, @cast_fields, [])
    |> validate_required(@required_fields)
    |> unique_constraint(:ip_address)
    |> validate_number(:pickup_lat, less_than_or_equal_to: @max_lat, greater_than_or_equal_to: @min_lat)
    |> validate_number(:pickup_lon, less_than_or_equal_to: @max_lon, greater_than_or_equal_to: @min_lon)
    |> validate_number(:delivery_lat, less_than_or_equal_to: @max_lat, greater_than_or_equal_to: @min_lat)
    |> validate_number(:delivery_lon, less_than_or_equal_to: @max_lon, greater_than_or_equal_to: @min_lon)
  end
end