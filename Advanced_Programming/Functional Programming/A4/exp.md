Part 1: Color Keyword List and Loop
Objective:

    Create a keyword list of colors where each entry contains a color name (as an atom) and its corresponding HTML color code (as a string).
    Implement a loop that lets the user input either a color name or an HTML color code.
    Depending on the input, either the color name or the HTML color value should be printed.
    If the user enters an unrecognized value, the loop should exit.

Approach:

    Creating the keyword list: A keyword list in Elixir is a list of tuples, where each tuple has an atom as the key and a value (in this case, the HTML color code).

    Example:

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

    Implementing the loop:
        The loop prompts the user to enter a color name or HTML color code.
        It checks if the input starts with # (indicating an HTML color code). If so, it searches for the corresponding color name in the keyword list.
        If the input is a color name, it retrieves the corresponding HTML color code from the list.
        If neither the color name nor the code is found, the loop exits.

    Example Flow:
        User input: red
            Output: The HTML value for red is #FF0000
        User input: #FF0000
            Output: The color for #FF0000 is red
        User input: exit
            Output: Exiting...

Part 2: Map for Books and Loop
Objective:

    Create a map where each key is a book ISBN and the value is the book name.
    Implement a loop that reads commands from the user to:
        List all books in the map.
        Search for a book by ISBN.
        Add a new book to the map.
        Remove a book by ISBN from the map.
        Quit the loop.

Approach:

    Creating the map: A map in Elixir is a key-value store where the keys can be of any type. In this case, the key is the ISBN of a book (as a string) and the value is the book's name (also a string).

    Example:

books = %{
  "978-3-16-148410-0" => "Elixir in Action",
  "978-0-13-475759-9" => "Programming Elixir",
  "978-1-61729-476-6" => "Learn You Some Erlang",
  "978-0-321-94613-5" => "The Pragmatic Programmer",
  "978-0-590-31514-4" => "Clean Code"
}

Implementing the loop:

    The loop listens for user commands such as list, search, add, remove, and quit.
    For list: It prints all the books in the map.
    For search ISBN: It looks up the ISBN in the map and prints the book's name.
    For add ISBN,NAME: It adds a new book to the map with the provided ISBN and book name.
    For remove ISBN: It removes a book from the map by ISBN.
    If quit is entered, the loop exits.

Example Flow:

    User input: list
        Output:

            978-3-16-148410-0: Elixir in Action
            978-0-13-475759-9: Programming Elixir
            978-1-61729-476-6: Learn You Some Erlang
            978-0-321-94613-5: The Pragmatic Programmer
            978-0-590-31514-4: Clean Code

        User input: search 978-3-16-148410-0
            Output: Book found: Elixir in Action (ISBN: 978-3-16-148410-0)
        User input: add 978-1-234-56789-0, The Joy of Elixir
            Output: Added new book: The Joy of Elixir with ISBN: 978-1-234-56789-0
        User input: remove 978-0-590-31514-4
            Output: Removed book with ISBN: 978-0-590-31514-4
        User input: quit
            Output: Exiting...

Summary:

    Keyword Lists: Used for simple key-value pair associations where the keys are atoms. They are ordered, can contain duplicate keys, and are typically used for passing optional arguments in functions.
    Maps: A more flexible and efficient key-value store where the keys can be of any type (not limited to atoms). Maps are unordered and are suitable for a wider range of use cases, such as storing collections of data like books.

The assignment involved creating two interactive loops in Elixir, demonstrating how to use keyword lists and maps in practice, while allowing users to interact with and modify data in real time.