defmodule Raindrops do
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
    case do_convert(number, []) do
      [] ->
        number |> Integer.to_string()

      output ->
        output |> List.to_string()
    end
  end

  defp do_convert(number, output) do
    cond do
      rem(number, 3) == 0 and "Pling" in output ->
        do_convert(div(number, 3), output)

      rem(number, 3) == 0 ->
        do_convert(div(number, 3), ["Pling" | output])

      rem(number, 5) == 0 and "Plang" in output ->
        do_convert(div(number, 5), output)

      rem(number, 5) == 0 ->
        do_convert(div(number, 5), ["Plang" | output])

      rem(number, 7) == 0 and "Plong" in output ->
        do_convert(div(number, 7), output)

      rem(number, 7) == 0 ->
        do_convert(div(number, 7), ["Plong" | output])

      true ->
        Enum.reverse(output)
    end
  end
end
