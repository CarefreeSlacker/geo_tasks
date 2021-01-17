use Mix.Config

config :geo_tasks, ecto_repos: [GeoTasks.Repo]

import_config "#{Mix.env()}.exs"
