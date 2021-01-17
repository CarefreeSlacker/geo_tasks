use Mix.Config

config :geo_tasks, GeoTasks.Repo,
       database: "geo_tasks_dev",
       username: "postgres",
       password: "postgres",
       hostname: "localhost",
       port: "5432"

config :logger, level: :debug
