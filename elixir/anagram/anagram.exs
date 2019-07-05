defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    match_candidates =
      candidates
      |> Enum.uniq_by(&String.downcase/1)
      |> Enum.filter(&is_equal?(base, &1))

    match_candidates -- [base]
  end

  defp sort_charlist(str) do
    str
    |> String.to_charlist()
    |> Enum.sort()
  end

  defp is_equal?(base, candidate) do
    sort_charlist(String.downcase(base)) == sort_charlist(String.downcase(candidate))
  end
end

