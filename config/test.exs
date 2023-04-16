use Mix.Config

config :pow_postgres_store,
  ecto_repos: [Pow.Postgres.Repo]

config :pow_postgres_store, Pow.Postgres.Repo,
  username: "postgres",
  password: "postgres",
  database: "chat_dev",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
