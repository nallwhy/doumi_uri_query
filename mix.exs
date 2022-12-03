defmodule Doumi.URI.Query.MixProject do
  use Mix.Project

  @source_url "https://github.com/nallwhy/doumi_uri_query"
  @version "0.1.0"

  def project do
    [
      app: :doumi_uri_query,
      version: @version,
      elixir: "~> 1.12",
      deps: deps(),
      package: package()
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      description: "A helper library that handles query of URI.",
      licenses: ["MIT"],
      maintainers: ["Jinkyou Son(nallwhy@gmail.com)"],
      files: ~w(lib mix.exs README.md LICENSE.md),
      links: %{
        "GitHub" => @source_url
      }
    ]
  end
end
