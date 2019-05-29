defmodule Raindrops do
  @factors %{3 => "Pling", 5 => "Plang", 7 => "Plong"}
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    @factors
    |> Map.keys()
    |> Enum.filter(&(rem(number, &1) == 0))
    |> Enum.map_join(&@factors[&1])
    |> output(number)
  end

  defp output("", number), do: Integer.to_string(number)
  defp output(str, _number), do: str
end
