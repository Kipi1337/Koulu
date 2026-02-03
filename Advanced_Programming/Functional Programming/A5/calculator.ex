# calculator.ex
defmodule Calculator do
  def calc(expression) do
    case parse_expression(expression) do
      {:ok, x, operator, y} ->
        case operator do
          "+" -> IO.puts("Result: #{Math.add(x, y)}")
          "-" -> IO.puts("Result: #{Math.sub(x, y)}")
          "*" -> IO.puts("Result: #{Math.mul(x, y)}")
          "/" -> IO.puts("Result: #{Math.div(x, y)}")
          _ -> IO.puts("Invalid operator!")
        end

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end

  defp parse_expression(expression) do
    # Regex to match expression like 123+456 or 789-123
    regex = ~r/(-?\d+)\s*([\+\-\*\/])\s*(-?\d+)/

    case Regex.run(regex, expression) do
      [_, x, operator, y] ->
        {:ok, String.to_integer(x), operator, String.to_integer(y)}

      _ ->
        {:error, "Invalid expression"}
    end
  end
end
