defmodule GeoTasks.Models.Token do
  @moduledoc """
  Describe token entity
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias GeoTasks.Models.User

  @cast_fields [
    :token,
    :expires_at,
    :user_id
  ]
  @required_fields [
    :token,
    :expires_at,
    :user_id
  ]
  @type t :: %__MODULE__{}

  schema "tokens" do
    field :token, :string
    field :expires_at, :naive_datetime

    belongs_to(:user, User)

    timestamps()
  end

  def changeset(entity \\ %__MODULE__{}, attrs) do
    entity
    |> cast(attrs, @cast_fields, [])
    |> validate_required(@required_fields)
  end
end