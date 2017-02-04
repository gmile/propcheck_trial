defmodule PropcheckTrial.Mixfile do
  use Mix.Project

  def project do
    [app: :propcheck_trial,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PropcheckTrial, []}
    ]
  end

  defp deps do
    [
      {:propcheck, ">= 0.0.0", only: [:dev, :test]},
      {:ecto, ">= 0.0.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
