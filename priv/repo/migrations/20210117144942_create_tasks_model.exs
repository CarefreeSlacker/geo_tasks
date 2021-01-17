defmodule GeoTasks.Repo.Migrations.CreateTasksModel do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :pickup_lat, :float
      add :pickup_lon, :float
      add :delivery_lat, :float
      add :delivery_lon, :float

      timestamps()
    end

    create index(:tasks, :pickup_lat)
    create index(:tasks, :pickup_lon)
    create index(:tasks, :delivery_lat)
    create index(:tasks, :delivery_lon)
  end
end
