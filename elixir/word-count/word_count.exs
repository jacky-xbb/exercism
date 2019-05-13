defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.replace(~r/[:,!&@$%^&_]/, " ")
    |> String.trim()
    |> String.downcase()
    |> String.split()
    |> update_count(%{})
  end

  defp update_count([], result), do: result

  defp update_count([h | t], result) do
    update_count(t, Map.update(result, h, 1, &(&1 + 1)))
  end
end

IO.inspect(Words.count("one of each"))
