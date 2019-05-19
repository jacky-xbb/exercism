defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ", trim: true)
    |> Enum.map(&do_translate(&1, ""))
    |> Enum.join(" ")
  end

  defp do_translate(phrase = <<"x", letter::bytes-size(1), rest::binary>>, "") do
    cond do
      is_consonant(letter) ->
        phrase <> "ay"

      is_vowel(letter) ->
        letter <> rest <> "xay"
    end
  end

  defp do_translate(phrase = <<"y", letter::bytes-size(1), rest::binary>>, "") do
    cond do
      is_consonant(letter) ->
        phrase <> "ay"

      is_vowel(letter) ->
        letter <> rest <> "yay"
    end
  end

  defp do_translate(_phrase = <<"qu", rest::binary>>, "") do
    rest <> "qu" <> "ay"
  end

  defp do_translate(phrase = <<letter::bytes-size(1), "qu", rest::binary>>, "") do
    cond do
      is_vowel(letter) ->
        phrase <> "ay"

      is_consonant(letter) ->
        rest <> letter <> "quay"
    end
  end

  defp do_translate(phrase = <<letter::bytes-size(1), rest::binary>>, result) do
    cond do
      is_vowel(letter) ->
        phrase <> result <> "ay"

      is_consonant(letter) ->
        do_translate(rest, result <> letter)
    end
  end

  defp is_vowel(letter) do
    String.contains?("aeiou", letter)
  end

  defp is_consonant(letter) do
    not is_vowel(letter)
  end
end
