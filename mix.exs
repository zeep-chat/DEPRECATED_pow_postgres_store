defmodule PowPostgresStore.MixProject do
  use Mix.Project

  def project do
    [
      app: :uaichat_pow_postgres_store,
      version: "1.0.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      package: package(),
      description: "Postgres-backed cache backend for pow",
      aliases: [
        test: [
          # generate the schema to test if schema generation works
          "pow.postgres.gen.schema --overwrite test/support/schema.ex",
          "ecto.drop",
          "ecto.create",
          "ecto.migrate",
          # finally, call the tests
          "test"
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:pow, ">= 1.0.0"},
      {:ecto_sql, ">= 3.0.0"},
      {:postgrex, "~> 0.15.3", only: :test},
      {:ex_doc, "> 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package() do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/uaichat/pow_postgres_store"
      }
    ]
  end
end
