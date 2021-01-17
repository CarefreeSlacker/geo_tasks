use Mix.Config

config :geo_tasks, GeoTasks.Repo,
       database: "geo_tasks_test",
       username: "postgres",
       password: "postgres",
       hostname: "localhost",
       pool: Ecto.Adapters.SQL.Sandbox,
       port: "5432"

config :logger, backends: []
