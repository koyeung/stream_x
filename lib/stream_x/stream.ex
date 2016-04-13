defmodule StreamX.Stream do
  @moduledoc ~S"""
  Extra Elixir Stream utilities
  """

  @type acc     :: any
  @type element :: any
  
  @doc ~S"""
  Transforms an existing stream, with different reducers

  It expects an accumulator and a function that receives each stream item
  and an accumulator, and must return a tuple containing a new stream
  (often a list), the new accumulator and next reducer function or a tuple with `:halt` as first
  element, the accumulator and next reducer function as other elements.

  ## Examples

  Take stream of numbers and show only multiple of the first number (excluding the first one).

      iex> defmodule Test do
      ...>   def f0(i, _acc) do
      ...>     {[], i, &f1/2}
      ...>   end
      ...> 
      ...>   def f1(i, acc) do
      ...>     if rem(i, acc) == 0, do: {[i], acc, &f1/2}, else: {[], acc, &f1/2}
      ...>   end
      ...> end
      iex> enum=2..20
      iex> stream = StreamX.Stream.transform(enum, 0, &Test.f0/2)
      iex> Enum.to_list(stream)
      [4, 6, 8, 10, 12, 14, 16, 18, 20]
  
  """
  @spec transform(Enumerable.t, acc, fun) :: Enumerable.t when
        fun: (element, acc -> {Enumerable.t, acc, fun} | {:halt, acc, fun}),
        acc: any
  def transform(enum, acc, reducer) when is_function(reducer, 2) do

    Stream.transform(enum, &(reducer.(&1, acc)), fn element, acc ->
      {element_list, next_acc, next_reducer} = acc.(element)
      {element_list, &(next_reducer.(&1, next_acc))}
    end)
    
  end
    
end
