defmodule GeoTasks.Contexts.DatabaseTest do
  use GeoTasks.DatabaseCase

  alias GeoTasks.Contexts.Database
  alias GeoTasks.Models.{Task, TaskUser, User}

  describe "Task" do
    test "#create_task if params valid" do
      before_task_count = count_resource(Task)

      assert {:ok, %Task{}} =
               Database.create_task(%{
                 pickup_lat: 2.222,
                 pickup_lon: 2.222,
                 delivery_lat: 2.222,
                 delivery_lon: 2.222
               })

      assert before_task_count + 1 == count_resource(Task)
    end

    test "#create_task if params invalid" do
      before_task_count = count_resource(Task)

      assert {:error, %Ecto.Changeset{}} =
               Database.create_task(%{pickup_lat: 2.222, pickup_lon: 2.222})

      assert before_task_count == count_resource(Task)
    end
  end

  describe "User" do
    test "#create_user if params valid" do
      before_user_count = count_resource(User)

      assert {:ok, %User{}} =
               Database.create_user(%{
                 name: "User",
                 role: "manager"
               })

      assert before_user_count + 1 == count_resource(User)
    end

    test "#create_user if params invalid" do
      before_user_count = count_resource(User)

      assert {:error, %Ecto.Changeset{}} =
               Database.create_user(%{
                 name: "User",
                 role: "unknown_role"
               })

      assert before_user_count == count_resource(User)
    end
  end

  describe "TaskUser" do
    setup do
      user = user_fixture(%{
        name: "User",
        role: "manager"
      })
      task = task_fixture(%{
        pickup_lat: 2.222,
        pickup_lon: 2.222,
        delivery_lat: 2.222,
        delivery_lon: 2.222
      })
      {:ok, task: task, user: user}
    end

    test "#create_task_user if params valid. Create entity with default finished: false", %{task: task, user: user} do
      before_task_user_count = count_resource(TaskUser)

      assert {:ok, %TaskUser{finished: false}} =
               Database.create_task_user(%{
                 task_id: task.id,
                 user_id: user.id
               })

      assert before_task_user_count + 1 == count_resource(TaskUser)
    end

    test "#create_task_user if params invalid", %{task: task} do
      before_task_user_count = count_resource(TaskUser)

      assert {:error, %Ecto.Changeset{}} =
               Database.create_task_user(%{
                 task_id: task.id
               })

      assert before_task_user_count == count_resource(TaskUser)
    end
  end
end
