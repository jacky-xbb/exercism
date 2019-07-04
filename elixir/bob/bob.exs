defmodule Bob do
  def hey(input) do
    cond do
      has_letters?(input) and uppercased?(input) and String.ends_with?(input, "?") ->
        "Calm down, I know what I'm doing!"

      String.ends_with?(input, "?") ->
        "Sure."

      String.trim(input) == "" ->
        "Fine. Be that way!"

      has_letters?(input) and uppercased?(input) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end

  defp has_letters?(input),
    do: String.upcase(input) != String.downcase(input)

  defp uppercased?(input),
    do: String.upcase(input) == input
end
