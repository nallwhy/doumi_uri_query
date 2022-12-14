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
      package: package(),
      docs: docs()
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
      {:ex_doc, "~> 0.28", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      description: "A helper library that supports encoding complicated query of URI.",
      licenses: ["MIT"],
      maintainers: ["Jinkyou Son(nallwhy@gmail.com)"],
      files: ~w(lib mix.exs README.md LICENSE.md),
      links: %{
        "GitHub" => @source_url
      }
    ]
  end

  defp docs do
    [
      extras: [
        "README.md": [title: "Overview"],
        "LICENSE.md": [title: "License"]
      ],
      source_url: @source_url,
      main: "readme",
      api_reference: false,
      formatters: ["html"]
    ]
  end
end
