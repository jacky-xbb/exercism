defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when length(a) == length(b) do
    case a === b do
      true -> :equal
      false -> :unequal
    end
  end

  def compare(a, b) when length(a) > length(b) do
    case contains?(a, b) do
      true -> :superlist
      false -> :unequal
    end
  end

  def compare(a, b) when length(a) < length(b) do
    case contains?(b, a) do
      true -> :sublist
      false -> :unequal
    end
  end

  defp contains?(a, b) when length(a) < length(b), do: false

  defp contains?(a = [_head | tail], b) do
    case Enum.take(a, length(b)) === b do
      true -> true
      false -> contains?(tail, b)
    end
  end
end
