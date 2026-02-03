# math.ex
defmodule Math do
  # Public functions
  def add(x, y) do
    info(x, y)
    x + y
  end

  def sub(x, y) do
    info(x, y)
    x - y
  end

  def mul(x, y) do
    info(x, y)
    x * y
  end

  def div(x, y) do
    info(x, y)
    if y == 0 do
      IO.puts "Cannot divide by zero"
    else
      x / y
    end
  end

  # Private info function
  defp info(x, y) do
    IO.puts "Performing operation with x=#{x} and y=#{y}"
  end
end
