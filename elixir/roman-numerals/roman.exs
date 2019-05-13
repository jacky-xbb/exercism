defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """

  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    number
    |> parse_int
    |> convert_to_roman
    |> Enum.join()
  end

  def convert_to_roman(num_lst) do
    num_lst
    |> Enum.map(&number_to_roman/1)
  end

  def parse_int(num) do
    _parse_int(div(num, 10), rem(num, 10), 0, [])
    |> Enum.map(&round/1)
    |> Enum.filter(fn x -> x != 0 end)
  end

  defp _parse_int(rest, ones, n, lst) do
    case rest do
      0 ->
        [ones * :math.pow(10, n) | lst]

      _ ->
        _parse_int(div(rest, 10), rem(rest, 10), n + 1, [ones * :math.pow(10, n) | lst])
    end
  end

  defp number_to_roman(num) do
    %{
      1 => "I",
      2 => "II",
      3 => "III",
      4 => "IV",
      5 => "V",
      6 => "VI",
      7 => "VII",
      8 => "VIII",
      9 => "IX",
      10 => "X",
      20 => "XX",
      30 => "XXX",
      40 => "XL",
      50 => "L",
      60 => "LX",
      70 => "LXX",
      80 => "LXXX",
      90 => "XC",
      100 => "C",
      200 => "CC",
      300 => "CCC",
      400 => "CD",
      500 => "D",
      600 => "DC",
      700 => "DCC",
      800 => "DCCC",
      900 => "CM",
      1000 => "M",
      2000 => "MM",
      3000 => "MMM"
    }[num]
  end
end

IO.inspect(Roman.numerals(1024))
