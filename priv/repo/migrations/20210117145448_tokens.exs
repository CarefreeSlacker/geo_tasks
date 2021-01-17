defmodule GeoTasks.Repo.Migrations.Tokens do
  use Ecto.Migration

  def change do
    create table(:tokens) do
      add :user_id, references(:users)
      add :token, :string
      add :expires_at, :naive_datetime

      timestamps()
    end
  end
end
