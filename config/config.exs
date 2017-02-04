use Mix.Config

config :propcheck_trial,
  ecto_repos: [PropcheckTrial.Repo]

config :propcheck_trial, PropcheckTrial.Repo,
  adapter: Ecto.Adapters.Postgres,
  priv: "priv/repo",
  database: "propcheck_trial",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool_size: 10
