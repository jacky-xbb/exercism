defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) when is_list(list) do
    do_flatten(list)
  end

  defp do_flatten([h | t]), do: do_flatten(h) ++ do_flatten(t)
  defp do_flatten([]), do: []
  defp do_flatten(nil), do: []
  defp do_flatten(elem), do: [elem]

end

