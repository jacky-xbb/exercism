defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.codepoints()
    |> Enum.map(&:binary.first/1)
    |> Enum.map(&do_shift(&1, shift))
    |> List.to_string()
  end

  defp do_shift(char, shift) when char in ?a..?z do
    n = rem(shift, 26)

    cond do
      char + n > ?z ->
        ?a + n - (?z - char) - 1

      true ->
        char + n
    end
  end

  defp do_shift(char, shift) when char in ?A..?Z do
    n = rem(shift, 26)

    cond do
      char + n > ?Z ->
        ?A + n - (?Z - char) - 1

      true ->
        char + n
    end
  end

  defp do_shift(char, _shift) do
    char
  end
end
