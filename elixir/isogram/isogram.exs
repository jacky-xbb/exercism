defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    letter_list = Regex.scan(~r/\w/, sentence)
    Enum.uniq(letter_list) == letter_list
  end
end

