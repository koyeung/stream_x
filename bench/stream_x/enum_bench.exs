defmodule StreamX.EnumBench do
  use Benchfella

  @lengths [4,8,16]
  for l <- @lengths do
    @l l
    @n div(l,2)

    bench "test #{@n} from #{l} with StreamX.Enum" do
      StreamX.Enum.combination(1..@l, @n)
    end

    bench "test #{@n} from #{l} with Combination" do
      Combination.combine(1..@l, @n)
    end

  end
  
end
