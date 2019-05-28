defmodule RunLengthEncoder do
  @expr_regex ~r/(?<number>\d+)(?<letter>[\s\S])/
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""

  def encode(string) do
    String.codepoints(string)
    |> do_encode({1, ""})
  end

  defp do_encode([a], {c, acc}) when c == 1, do: acc <> "#{a}"
  defp do_encode([a], {c, acc}), do: acc <> "#{c}#{a}"
  defp do_encode([a, a | t], {c, acc}), do: do_encode([a | t], {c + 1, acc})
  defp do_encode([a, b | t], {c, acc}) when c == 1, do: do_encode([b | t], {1, acc <> "#{a}"})
  defp do_encode([a, b | t], {c, acc}), do: do_encode([b | t], {1, acc <> "#{c}#{a}"})

  def decode(string) do
    Regex.replace(@expr_regex, string, fn _, number, letter ->
      String.duplicate(letter, String.to_integer(number))
    end)
  end
end
