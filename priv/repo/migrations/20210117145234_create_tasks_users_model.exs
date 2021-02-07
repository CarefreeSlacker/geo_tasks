defmodule GeoTasks.Repo.Migrations.CreateTasksUsersModel do
  use Ecto.Migration

  def change do
    create table(:tasks_users) do
      add :user_id, references(:users)
      add :task_id, references(:tasks)
      add :finished, :boolean, default: false

      timestamps()
    end
  end
end
