use Mix.Config

config :propcheck_trial,
  ecto_repos: [PropcheckTrial.Repo]

config :propcheck_trial, PropcheckTrial.Repo,
  adapter: Ecto.Adapters.Postgres,
  priv: "priv/repo",
  database: "propcheck_trial_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool_size: 10

import_config "#{Mix.env}.exs"
