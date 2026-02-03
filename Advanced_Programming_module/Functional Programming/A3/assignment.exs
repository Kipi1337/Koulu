# Part 1: Check divisibility
IO.puts("Part 1: Divisibility check")

# Ask for a number from the user
number = IO.gets("Enter a number: ") |> String.trim() |> String.to_integer()

# Check divisibility by 3, 5, or 7
cond do
  rem(number, 3) == 0 -> IO.puts("Divisible by 3")
  rem(number, 5) == 0 -> IO.puts("Divisible by 5")
  rem(number, 7) == 0 -> IO.puts("Divisible by 7")
  true ->
    # Find the smallest divisor (excluding 1)
    smallest_divisor = Enum.find(2..number, fn x -> rem(number, x) == 0 end)
    IO.puts("Smallest divisor: #{smallest_divisor}")
end


# Part 2: Anonymous function to check types and return results
IO.puts("Part 2: Anonymous function with guards")

# Define the anonymous function with guards
combine_or_add = fn
  (x, y) when is_binary(x) and is_binary(y) -> x <> y  # Concatenate if both are strings
  (x, y) -> x + y  # Add if parameters are not both strings
end

# Test the anonymous function with string and number parameters
IO.puts(combine_or_add.("Hello", " World"))  # Output: "Hello World"
IO.puts(combine_or_add.(10, 5))              # Output: 15
