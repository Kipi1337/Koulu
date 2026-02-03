# Part 1: Count words in the string
sentence = "99 bottles of beer on the wall"
word_count = sentence |> String.split() |> length()
IO.puts("Number of words: #{word_count}")
