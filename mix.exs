defmodule StreamX.Mixfile do
  use Mix.Project

  def project do
    [app: :stream_x,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps,
     source_url: "https://github.com/koyeung/stream_x",
     docs: &docs/0,
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
      {:ex_doc,  ">= 0.0.0", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
    ]
  end

  defp description do
    """
    Extra Elixir Stream utilities
    """
  end
  
  defp package do
    [
        maintainers: ["King-On Yeung"],
        licenses: ["Apache License 2.0"],
        links: %{"GitHub" => "https://github.com/koyeung/stream_x" },
    ]
  end

  defp docs do
    {ref, 0} = System.cmd("git", ["rev-parse", "--verify", "--quiet", "HEAD"])
    [
      source_ref: ref,
      readme: "README.md",
    ]
  end
  
end
