defmodule StreamX.Mixfile do
  use Mix.Project

  def project do
    [app: :stream_x,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     deps: deps,

     # metadata for Hex publishing
     package: package,
     
     # setup for ExDoc
     source_url: "https://github.com/koyeung/stream_x",
     docs: &docs/0,

     # ExCoveralls
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test],
     
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      # ExDoc - produces HTML and online documentation for Elixir projects
      {:ex_doc,  ">= 0.11.4", only: [:dev, :docs]},
      {:earmark, ">= 0.2.1", only: [:dev, :docs]},

      # Mix task that gives you hints where to improve your inline docs
      {:inch_ex, "~> 0.5.1", only: :docs},

      # Coverage report tool for Elixir with coveralls.io integration
      {:excoveralls, "~> 0.5.2", only: :test},

      # Microbenchmarking tool
      {:benchfella, "~> 0.3.2", only: :bench},
      
      # compare to other utilities
      {:combination, "~> 0.0.2", only: [:test, :bench]},
    ]
  end

  defp description do
    """
    Extra Elixir Stream utilities
    """
  end

  #
  # metadata for publishing Hex package
  #
  defp package do
    [
        maintainers: ["King-On Yeung"],
        licenses: ["Apache License 2.0"],
        links: %{"GitHub" => "https://github.com/koyeung/stream_x" },
    ]
  end

  #
  # metadata for ExDoc
  #
  defp docs do
    {ref, 0} = System.cmd("git", ["rev-parse", "--verify", "--quiet", "HEAD"])
    [
      source_ref: ref,
      readme: "README.md",
    ]
  end
  
end
