defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.codepoints()
    |> do_encode("", 1, [])
  end

  defp do_encode([], item, cnt, result) when cnt > 1,
    do: [Integer.to_string(cnt) <> item | result] |> Enum.reverse() |> Enum.join()

  defp do_encode([], item, _cnt, result), do: [item | result] |> Enum.reverse() |> Enum.join()

  defp do_encode([head | tail], item, cnt, result) when head == item,
    do: do_encode(tail, item, cnt + 1, result)

  defp do_encode([head | tail], item, cnt, result) when head != item and cnt > 1,
    do: do_encode(tail, head, 1, [Integer.to_string(cnt) <> item | result])

  defp do_encode([head | tail], item, _cnt, result) when head != item,
    do: do_encode(tail, head, 1, [item | result])

  @expr_regex ~r/(?<number>\d+)(?<letter>[\s\S])/
  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.replace(@expr_regex, string, fn _, number, char ->
      String.duplicate(char, String.to_integer(number))
    end)
  end

  # def decode(string) do
  #   Regex.scan(~r/(\d+)(.)/, string)
  #   |> Enum.map_join(fn [_, n, c] -> String.duplicate(c, String.to_integer(n)) end)
  # end

  # def decode(string) do
  #   for [_, n, s] <- Regex.scan(~r/(\d+)(.)/, string), into: "" do
  #     String.duplicate(s, String.to_integer(n))
  #   end
  # end
end

# IO.inspect(RunLengthEncoder.decode("12WB12W3B24WB"))
# IO.inspect(RunLengthEncoder.decode("2 hs2q q2w2 "))
# IO.inspect(RunLengthEncoder.decode("abc"))

IO.inspect(RunLengthEncoder.decode("12WB12W3B24WB"))
