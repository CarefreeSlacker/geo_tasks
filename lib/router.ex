defmodule GeoTasks.Router do
  use Plug.Router

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug Plug.Logger
  plug :match
  plug :dispatch

  # allowed Manager
  post "/api/manager_tasks_list" do
    send_resp(conn, 200, "manager_tasks_list")
  end

  # allowed Manager
  post "/api/tasks" do
    send_resp(conn, 200, "create_tasks")
  end

  # allowed Driver
  get "/api/tasks" do
    send_resp(conn, 200, "driver_tasks")
  end

  # allowed Driver
  post "/api/assign_task" do
    send_resp(conn, 200, "assign_task")
  end

  # allowed Driver
  patch "/api/update_task_status" do
    send_resp(conn, 200, "update_task_status")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end