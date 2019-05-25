defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size <= 0, do: []
  def slices(s, size), do: do_slices(s, 0, size, [])

  defp do_slices(s, start, len, list) do
    cond do
      start + len > String.length(s) ->
        Enum.reverse(list)

      true ->
        do_slices(s, start + 1, len, [String.slice(s, start, len) | list])
    end
  end
end
