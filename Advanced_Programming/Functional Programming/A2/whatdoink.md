Part 1: Counting Words in the String

sentence = "99 bottles of beer on the wall"
word_count = sentence |> String.split() |> length()
IO.puts("Number of words: #{word_count}")

    sentence: Defines the string "99 bottles of beer on the wall".
    String.split(): This function splits the sentence into a list of words (split by spaces). The result would be: ["99", "bottles", "of", "beer", "on", "the", "wall"].
    length(): This calculates the number of elements (words) in the list. In this case, the result will be 7.
    IO.puts/1: This prints the result (Number of words: 7) to the console.

Part 2: Translating to Pig Latin

The second part is the translation of the sentence to Pig Latin.
Step-by-Step Walkthrough of the PigLatin Module

defmodule PigLatin do
  def translate(sentence) do
    sentence
    |> String.split()
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

    defmodule PigLatin do: This defines a module named PigLatin.
    translate/1 function: The main function responsible for translating the whole sentence into Pig Latin:
        String.split(): Splits the sentence into words.
        Enum.map(&translate_word/1): Transforms each word into its Pig Latin equivalent by calling the helper function translate_word/1 on each word.
        Enum.join(" "): Joins the translated words back into a single string, separated by spaces.

Now let's look at the translate_word/1 function:

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

    defp translate_word(word): A private function that translates a single word into Pig Latin.
    cond: A conditional expression that checks different patterns to decide how to translate the word.

Case 1: Words Beginning with Vowels

String.match?(word, ~r/^[aeiouAEIOU]/) -> word <> "ay"

    String.match?: Checks if the word starts with a vowel (either lowercase or uppercase).
    word <> "ay": If it does, the function appends "ay" to the word.

Case 2: Special Consonant Groups (like "ch", "qu", etc.)

String.match?(word, ~r/^(ch|qu|squ|th|thr|sch)/i) -> word <> "ay"

    String.match?: Checks if the word starts with any of the special consonant groups (e.g., "ch", "qu", "squ", "th", "thr", "sch").
    word <> "ay": If the word starts with one of these groups, "ay" is appended to the word.

Case 3: Words Starting with Regular Consonants

[head | tail] = String.graphemes(word)
Enum.join(tail) <> head <> "ay"

    String.graphemes(word): Splits the word into individual characters (graphemes).
    [head | tail]: The first character is assigned to head, and the rest of the characters are assigned to tail.
    Enum.join(tail): Joins the tail (the remaining characters) back into a string.
    Enum.join(tail) <> head <> "ay": The tail is concatenated with the head (moved to the end of the word), and "ay" is added to the result.

Putting It All Together

    The input string is split into words.
    Each word is processed by the translate_word/1 function, where it is translated into Pig Latin.
    The words are then rejoined into a single string, and the final result is printed.

Example Walkthrough

For the sentence "Pattern Matching with Elixir. Remember that equals sign is a match operator, not an assignment":

    Splitting the sentence: ["Pattern", "Matching", "with", "Elixir.", "Remember", "that", "equals", "sign", "is", "a", "match", "operator,", "not", "an", "assignment"]

    Translation to Pig Latin:
        "Pattern" → "Aternpay"
        "Matching" → "Atchingmay"
        "with" → "ithway"
        "Elixir." → "Elixiray." (Note punctuation is left intact.)
        "Remember" → "Ememberray"
        "that" → "Athay"
        "equals" → "equalsay"
        "sign" → "ignsay"
        "is" → "isay"
        "a" → "aay"
        "match" → "atchmay"
        "operator," → "peratoray," (Punctuation is also preserved.)
        "not" → "otnay"
        "an" → "anay"
        "assignment" → "assignmentay"
