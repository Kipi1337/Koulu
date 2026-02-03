Elixir Keyword Lists and Maps

In Elixir, keyword lists and maps are the two main associative data structures that allow you to associate values with keys. They both have different characteristics and use cases, so let's explore them in detail.
1. Keyword Lists

A keyword list is a list of 2-item tuples where the first element of each tuple is an atom (a type of key). It’s a common way to represent key-value pairs in Elixir. Keyword lists are often used for passing optional parameters.
Syntax:

You can define a keyword list using the [key: value] syntax, which is just a shorthand for a list of 2-item tuples like [{key, value}].

iex> list = [{:a, 1}, {:b, 2}]
[a: 1, b: 2]
iex> list == [a: 1, b: 2]
true

Key Characteristics of Keyword Lists:

    Keys must be atoms: Only atoms can be used as keys.
    Keys are ordered: The order of key-value pairs is preserved.
    Keys can be repeated: Multiple occurrences of the same key are allowed, and when accessed, the last occurrence is fetched.

Example of accessing keys:

iex> new_list = [a: 0] ++ list
[a: 0, a: 1, b: 2]
iex> new_list[:a]
0

2. Maps

A map is a more general key-value store and is used when you need a flexible and efficient associative data structure. In maps, keys can be any type (not just atoms), and the keys are unordered.
Syntax:

You can define a map using the %{} syntax.

iex> map = %{:a => 1, 2 => :b}
%{2 => :b, :a => 1}
iex> map[:a]
1
iex> map[2]
:b
iex> map[:c]
nil

Key Characteristics of Maps:

    Keys can be any type: Unlike keyword lists, maps allow any type of key, such as integers, strings, or atoms.
    Keys are unordered: The keys in maps do not have an inherent order.
    Pattern matching is easy: Maps are useful in pattern matching, and you can match on a subset of keys.

Example of pattern matching:

iex> %{:a => a} = %{:a => 1, 2 => :b}
%{2 => :b, :a => 1}
iex> a
1

Updating Maps:

To update a key’s value in a map, you can use the | operator:

iex> map = %{:a => 1, 2 => :b}
%{2 => :b, :a => 1}

iex> %{map | 2 => "two"}
%{2 => "two", :a => 1}

However, this syntax only works if the key already exists in the map.
Convenience for Atoms:

When keys are atoms, you can use a more compact syntax:

iex> map = %{a: 1, b: 2}
%{a: 1, b: 2}
iex> map.a
1
iex> map.c
** (KeyError) key :c not found in: %{a: 1, b: 2}

3. Nested Data Structures

Maps and keyword lists can be nested, meaning you can have maps inside maps, keyword lists inside maps, and so on. Elixir provides functions like put_in/2, update_in/2, and others to manipulate such nested structures immutably.
Example:

Imagine you have a list of users with their age, name, and favorite languages:

iex> users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Python"]}
]

You can access and modify nested fields easily:

# Access John's age
iex> users[:john].age
27

# Update John's age
iex> users = put_in(users[:john].age, 31)
[john: %{age: 31, languages: ["Erlang", "Ruby", "Elixir"], name: "John"},
 mary: %{age: 29, languages: ["Elixir", "F#", "Python"], name: "Mary"}]

# Remove "Python" from Mary's languages
iex> users = update_in(users[:mary].languages, fn languages -> List.delete(languages, "Python") end)
[john: %{age: 31, languages: ["Erlang", "Ruby", "Elixir"], name: "John"},
 mary: %{age: 29, languages: ["Elixir", "F#"], name: "Mary"}]

Conclusion

    Keyword lists are great when you need ordered key-value pairs where keys are atoms, and duplicates are allowed (useful for passing optional arguments).
    Maps are more general-purpose and efficient, allowing for any type of key and providing powerful pattern matching capabilities.
    When dealing with nested data structures, you can leverage Elixir's built-in functions like put_in/2 and update_in/2 to immutably update and manipulate the data.