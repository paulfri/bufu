defmodule Bufu.Mixfile do
  use Mix.Project

  def project do
    [app: :bufu,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     deps: deps]
  end

  def application do
    [
      applications: [
        :logger,
        :httpotion
      ]
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:ex_doc, "~> 0.12", only: :dev},
      {:exvcr, "~> 0.7", only: :test},
      {:httpotion, "~> 3.0"},
      {:poison, "~> 2.2"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/helpers"]
  defp elixirc_paths(_), do: ["lib"]
end
