defmodule PigLatin do
  def translate(sentence) do
    sentence
    |> String.split()
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    cond do
      # Words beginning with a vowel (aeiou)
      String.match?(word, ~r/^[aeiouAEIOU]/) -> word <> "ay"

      # Handle special consonant groups (ch, qu, etc.)
      String.match?(word, ~r/^(ch|qu|squ|th|thr|sch)/i) ->
        word <> "ay"

      # For other consonant-starting words
      true ->
        [head | tail] = String.graphemes(word)
        Enum.join(tail) <> head <> "ay"
    end
  end
end

# Test the translation
sentence = "Pattern Matching with Elixir. Remember that equals sign is a match operator, not an assignment"
translated_sentence = PigLatin.translate(sentence)
IO.puts("Pig Latin Translation: #{translated_sentence}")
