defmodule DigestAuth.Mixfile do
  use Mix.Project

  def project do
    [
      app: :http_digex,
      version: "0.0.2-dev",
      elixir: "~> 1.2",
      source_url: "https://github.com/techgaun/http_digex",
      test_coverage: [tool: ExCoveralls],
      description: "A module to create basic digest http auth header",
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:excoveralls, "~> 0.5", only: :test},
      {:dogma, "~> 0.1", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      maintainers: [
        "Samar Acharya"
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/techgaun/http_digex"}
    ]
  end
end
