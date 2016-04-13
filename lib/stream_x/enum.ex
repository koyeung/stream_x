defmodule StreamX.Enum do
  @moduledoc ~S"""
  Extra Elixir Enum utilities
  """

  @doc ~S"""
  Generate combinations from the enumerable

  ## Examples

  List of combinations of 2 number from range `1..3`

      iex> 1..3 |> StreamX.Enum.combination(2) |> Enum.map(&Enum.sort/1) |> Enum.sort
      [[1, 2], [1, 3], [2, 3]]

  """
  @spec combination(Enumerable.t, integer) :: list
  def combination(enum, n) when is_integer(n) and n >= 0 do
    do_combination(Enum.to_list(enum), n)
  end
  
  defp do_combination(_, 0), do: [[]]
  defp do_combination([], _), do: []
  defp do_combination([x|xs], n) do

    do_combination(xs, n-1)
        |> Enum.map( &[x| &1] )

            |> Enum.concat(do_combination(xs, n))    
  end
  
end
