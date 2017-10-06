defmodule Bufu.Mixfile do
  use Mix.Project

  def project do
    [app: :bufu,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     deps: deps(),
     description: description(),
     package: package()]
  end

  def application do
    [applications: [:httpotion]]
  end

  defp deps do
    [{:credo, "~> 0.4", only: [:dev, :test]},
     {:ex_doc, "~> 0.12", only: :dev},
     {:exvcr, "~> 0.9.0", only: :test},
     {:httpotion, "~> 3.0.3"},
     {:poison, "~> 3.0"}]
  end

  defp description do
  """
  Giant Bomb API client library.
  """
  end

  defp package do
  [name: "bufu",
   licenses: ["MIT"],
   maintainers: ["Paul Friedman"],
   links: %{"GitHub" => "https://github.com/paulfri/bufu"}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/helpers"]
  defp elixirc_paths(_), do: ["lib"]
end
