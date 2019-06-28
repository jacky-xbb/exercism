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
  def flatten(list) do
    do_flatten(list, [])
  end

  defp do_flatten([], flatten_list), do: Enum.sort(flatten_list)
  defp do_flatten([h | t], flatten_list) when is_nil(h) do
    do_flatten(t, flatten_list)
  end
  defp do_flatten([h | t], flatten_list) when is_integer(h) do
    do_flatten(t, [h | flatten_list])
  end
  defp do_flatten([[] | t], flatten_list) do
    do_flatten(t, flatten_list)
  end
  defp do_flatten([h | t], flatten_list) when is_list(h) do
    do_flatten([hd(h), tl(h) | t], flatten_list)
  end
end

