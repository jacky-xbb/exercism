defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      equals?(a, b) -> :equal
      contains?(a, b) -> :superlist
      contains?(b, a) -> :sublist
      true -> :unequal
    end
  end

  defp equals?(a, b), do: a === b

  defp contains?(a, b) when length(a) < length(b), do: false

  defp contains?(a = [_head | tail], b) do
    case Enum.take(a, length(b)) === b do
      true -> true
      false -> contains?(tail, b)
    end
  end
end
