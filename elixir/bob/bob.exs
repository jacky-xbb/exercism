defmodule Bob do


   def hey(phrase) do
    cond do
      is_silence?(phrase) ->
        "Fine. Be that way!"
      is_ask_in_capitals?(phrase) && is_question?(phrase) ->
        "Calm down, I know what I'm doing!"
      is_shouting_numbers?(phrase) || is_russian?(phrase) || is_shouting_with_uppercase?(phrase) ->
        "Whoa, chill out!"
      is_question?(phrase) ->
        "Sure."
      true ->
        "Whatever."
    end
  end

  defp is_silence?(phrase), do: String.trim(phrase) == ""
  defp is_ask_in_capitals?(phrase) do
    phrase
    |> String.replace(~r/\?$/, "")
    |> String.split()
    |> Enum.all?(fn x -> String.match?(x, ~r/^[A-Z]/) end)
  end
  defp is_russian?(phrase) do
    phrase
    |> String.match?(~r/[а-яА-Я]+/)
  end
  defp is_shouting_numbers?(phrase) do
    String.match?(phrase, ~r/[0-9]/) && String.ends_with?(phrase, "!")
  end
  defp is_shouting_with_uppercase?(phrase) do
    case String.ends_with?(phrase, "!") do
      true ->
        phrase |> String.trim_trailing("!") |> String.match?(~r/^[A-Z\s]+$/)
      false ->
        String.match?(phrase, ~r/^[A-Z\s]+$/)
    end
  end
  defp is_question?(phrase), do: String.ends_with?(phrase, "?")
end





