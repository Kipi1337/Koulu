# Part 1: Keyword List for Colors
colors = [
  red: "#FF0000",
  green: "#008000",
  blue: "#0000FF",
  yellow: "#FFFF00",
  black: "#000000",
  white: "#FFFFFF",
  orange: "#FFA500",
  purple: "#800080",
  pink: "#FFC0CB",
  brown: "#A52A2A"
]

# Loop for user input
defmodule ColorLoop do
  def start_loop(colors) do
    IO.puts("Enter a color name or HTML value (or type 'exit' to quit):")

    loop(colors)
  end

  defp loop(colors) do
    input = IO.gets("> ") |> String.trim()

    if input == "exit" do
      IO.puts("Exiting...")
    else
      handle_input(input, colors)
      loop(colors)
    end
  end

  defp handle_input(input, colors) do
    if String.starts_with?(input, "#") do
      # Search by HTML value (input starts with '#')
      color_name = Enum.find_value(colors, fn {name, value} -> if value == input, do: name, else: nil end)
      if color_name do
        IO.puts("The color for #{input} is #{color_name}")
      else
        IO.puts("Color not found.")
      end
    else
      # Search by color name
      color_value = Keyword.get(colors, String.to_atom(input))
      if color_value do
        IO.puts("The HTML value for #{input} is #{color_value}")
      else
        IO.puts("Color not found.")
      end
    end
  end
end

# Start the loop
ColorLoop.start_loop(colors)
