defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    for n <- 2..limit-1, f <- factors do
      case rem(n, f) do
        0 -> n
        _ -> 0
      end
    end
    |> Enum.uniq()
    |> Enum.sum()
  end
end
