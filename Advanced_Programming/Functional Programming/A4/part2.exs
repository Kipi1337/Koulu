# Part 2: Map for Books
books = %{
  "978-3-16-148410-0" => "Elixir in Action",
  "978-0-13-475759-9" => "Programming Elixir",
  "978-1-61729-476-6" => "Learn You Some Erlang",
  "978-0-321-94613-5" => "The Pragmatic Programmer",
  "978-0-590-31514-4" => "Clean Code"
}

# Loop for user commands
defmodule BookLoop do
  def start_loop(books) do
    IO.puts("Enter a command (list, search ISBN, add ISBN,NAME, remove ISBN, quit):")

    loop(books)
  end

  defp loop(books) do
    input = IO.gets("> ") |> String.trim()

    cond do
      input == "quit" ->
        IO.puts("Exiting...")

      input == "list" ->
        list_books(books)
        loop(books)

      String.starts_with?(input, "search") ->
        search_book(input, books)
        loop(books)

      String.starts_with?(input, "add") ->
        add_book(input, books)
        loop(books)

      String.starts_with?(input, "remove") ->
        remove_book(input, books)
        loop(books)

      true ->
        IO.puts("Unknown command.")
        loop(books)
    end
  end

  defp list_books(books) do
    IO.puts("Books in the collection:")
    Enum.each(books, fn {isbn, name} -> IO.puts("#{isbn}: #{name}") end)
  end

  defp search_book(input, books) do
    [_, isbn] = String.split(input)
    case Map.get(books, isbn) do
      nil -> IO.puts("Book not found.")
      name -> IO.puts("Book found: #{name} (ISBN: #{isbn})")
    end
  end

  defp add_book(input, books) do
    [_, isbn, name] = String.split(input, ",")
    new_books = Map.put(books, isbn, name)
    IO.puts("Added new book: #{name} with ISBN: #{isbn}")
    start_loop(new_books) # restart loop with updated books
  end

  defp remove_book(input, books) do
    [_, isbn] = String.split(input)
    if Map.has_key?(books, isbn) do
      new_books = Map.delete(books, isbn)
      IO.puts("Removed book with ISBN: #{isbn}")
      start_loop(new_books) # restart loop with updated books
    else
      IO.puts("Book not found.")
      loop(books)
    end
  end
end

# Start the book loop
BookLoop.start_loop(books)
