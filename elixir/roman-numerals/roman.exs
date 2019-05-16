defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  # Original
  # @spec numerals(pos_integer) :: String.t()
  # def numerals(number) do
  #   number
  #   |> do_parse_int
  #   |> do_convert_to_roman
  #   |> Enum.join()
  # end

  # defp do_convert_to_roman(num_lst) do
  #   num_lst
  #   |> Enum.map(&number_to_roman/1)
  # end

  # defp do_parse_int(num) do
  #   do_parse_int(div(num, 10), rem(num, 10), 0, [])
  #   |> Enum.map(&round/1)
  #   |> Enum.filter(fn x -> x != 0 end)
  # end

  # defp do_parse_int(rest, ones, n, lst) do
  #   case rest do
  #     0 ->
  #       [ones * :math.pow(10, n) | lst]

  #     _ ->
  #       do_parse_int(div(rest, 10), rem(rest, 10), n + 1, [ones * :math.pow(10, n) | lst])
  #   end
  # end

  # defp number_to_roman(num) do
  #   %{
  #     1 => "I",
  #     2 => "II",
  #     3 => "III",
  #     4 => "IV",
  #     5 => "V",
  #     6 => "VI",
  #     7 => "VII",
  #     8 => "VIII",
  #     9 => "IX",
  #     10 => "X",
  #     20 => "XX",
  #     30 => "XXX",
  #     40 => "XL",
  #     50 => "L",
  #     60 => "LX",
  #     70 => "LXX",
  #     80 => "LXXX",
  #     90 => "XC",
  #     100 => "C",
  #     200 => "CC",
  #     300 => "CCC",
  #     400 => "CD",
  #     500 => "D",
  #     600 => "DC",
  #     700 => "DCC",
  #     800 => "DCCC",
  #     900 => "CM",
  #     1000 => "M",
  #     2000 => "MM",
  #     3000 => "MMM"
  #   }[num]
  # end

  # Better
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) when number >= 1000, do: "M" <> numerals(number - 1000)
  def numerals(number) when number >= 900, do: "CM" <> numerals(number - 900)
  def numerals(number) when number >= 500, do: "D" <> numerals(number - 500)
  def numerals(number) when number >= 400, do: "CD" <> numerals(number - 400)
  def numerals(number) when number >= 100, do: "C" <> numerals(number - 100)
  def numerals(number) when number >= 90, do: "XC" <> numerals(number - 90)
  def numerals(number) when number >= 50, do: "L" <> numerals(number - 50)
  def numerals(number) when number >= 40, do: "XL" <> numerals(number - 40)
  def numerals(number) when number >= 10, do: "X" <> numerals(number - 10)
  def numerals(number) when number >= 9, do: "IX" <> numerals(number - 9)
  def numerals(number) when number >= 5, do: "V" <> numerals(number - 5)
  def numerals(number) when number >= 4, do: "IV" <> numerals(number - 4)
  def numerals(number) when number >= 1, do: "I" <> numerals(number - 1)
  def numerals(_), do: ""
end

# IO.inspect(Roman.numerals(1024))
