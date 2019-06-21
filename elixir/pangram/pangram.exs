defmodule Pangram do
  @letters "abcdefghijklmnopqrstuvwxyz"
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence_char_list = sentence |> String.downcase() |> String.to_charlist()

    @letters
    |> String.to_charlist()
    |> Enum.all?(fn char -> char in sentence_char_list end)
  end
end


