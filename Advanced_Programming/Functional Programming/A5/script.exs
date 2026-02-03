defmodule CalculatorApp do
  IO.puts("Welcome to the Calculator! Enter expressions (e.g., 123+456)")

  def start do
    loop()
  end

  defp loop() do
    input = IO.gets("Enter expression: ")

    # Remove trailing newline and check for valid input
    input = String.trim(input)

    if input == "" do
      IO.puts("Goodbye!")
      exit(:normal)
    else
      # Pass input to the Calculator module
      case Calculator.calc(input) do
        {:error, _} ->
          IO.puts("Invalid input, try again.")
          loop()

        result ->
          IO.puts("Result: #{result}")
          loop()
      end
    end
  end
end

# Start the application
CalculatorApp.start()
