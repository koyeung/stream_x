defmodule StreamX.EnumTest do
  use ExUnit.Case
  doctest StreamX.Enum

  test "comparing with :combination" do
    input=1..16
    n=8
    result = StreamX.Enum.combination(input, n) |> Enum.map(&Enum.sort/1) |> Enum.sort
    ref_result = Combination.combine(input, n) |> Enum.map(&Enum.sort/1) |> Enum.sort

    assert result == ref_result
  end

end
