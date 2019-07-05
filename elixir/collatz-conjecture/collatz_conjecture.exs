defmodule CollatzConjecture do

  defguard is_invalid(value) when value <= 0 or not is_integer(value)
  defguard is_even(value) when rem(value, 2) == 0
  defguard is_odd(value) when rem(value, 2) == 1
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_invalid(input), do: raise FunctionClauseError
  def calc(input), do: do_calc(input, 0)

  defp do_calc(1, n), do: n
  defp do_calc(number, n) when is_odd(number), do: do_calc(number*3+1, n+1)
  defp do_calc(number, n) when is_even(number), do: do_calc(div(number, 2), n+1)
end

