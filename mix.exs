defmodule Mamebus.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mamebus,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      escript: escript_config()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      httpoison: "~> 0.12",
      csv: "~> 2.0"
    ]
  end

  def escript_config do
    [main_module: Mamebus.CLI]
  end
end
