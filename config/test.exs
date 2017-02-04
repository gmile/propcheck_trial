use Mix.Config

config :propcheck_trial, PropcheckTrial.Repo,
  adapter: Ecto.Adapters.Postgres,
  priv: "priv/repo",
  database: "propcheck_trial_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
