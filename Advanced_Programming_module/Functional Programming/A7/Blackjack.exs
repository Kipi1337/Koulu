# Defines the Card module, which contains functions related to individual playing cards.
defmodule Card do
  # List of tuples mapping card names to their values in Blackjack.
  @value_list [
    {"Ace", 11},
    {"2", 2},
    {"3", 3},
    {"4", 4},
    {"5", 5},
    {"6", 6},
    {"7", 7},
    {"8", 8},
    {"9", 9},
    {"10", 10},
    {"Jack", 10},
    {"Queen", 10},
    {"King", 10}
  ]

  # Determines the value of an Ace based on the current total score.
  def ace_value_with(value_of_rest) do
    if value_of_rest > 10, do: 1, else: 11
  end

  # Wraps a card rank in a tuple for uniformity.
  def from_rank(rank) do
    {rank}
  end

  # Finds the value of a card given its rank.
  def value({rank}) do
    Enum.find(@value_list, fn {r, _} -> r == rank end)
    |> elem(1)  # Returns the value associated with the rank.
  end
end

# Defines the Hand module to handle the score calculation for a player's hand.
defmodule Hand do
  # Calculates the total value of a hand of cards.
  def value(hand) do
    # Groups the cards by whether they are Aces or not.
    map = hand |> Enum.group_by(fn(c) -> elem(c, 0) == "Ace" end)
    aces = map[true] || []
    others = map[false] || []

    # Sums the value of non-Ace cards.
    others_val = others |> Enum.map(&Card.value/1) |> Enum.sum
    value_with_aces(length(aces), others_val)
  end

  # Calculates the final value of the hand considering Aces as either 1 or 11.
  defp value_with_aces(0, others_val), do: others_val
  defp value_with_aces(num_aces, others_val) do
    val_as_ones = others_val + num_aces
    # If adding the Aces as 11 doesn't bust the hand, treat them as 11.
    if val_as_ones <= 11, do: val_as_ones + 10, else: val_as_ones
  end
end

# Defines the Deck module to handle creating and dealing the deck.
defmodule Deck do
  # Creates a new shuffled deck of cards.
  def new do
    ranks = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]

    # Converts the ranks into cards and shuffles them.
    ranks
    |> Enum.flat_map(fn rank ->
      List.duplicate(Card.from_rank(rank), 4)
    end)
    |> Enum.shuffle()
  end

  # Deals a hand (first two cards) from the deck and returns the remaining deck.
  def deal_hand(deck) do
    {hand, remaining_deck} = Enum.split(deck, 2)
    {hand, remaining_deck}
  end
end

# Defines the Game module, which handles the main gameplay logic.
defmodule Game do
  # Starts the game by initializing the deck and dealing hands to the player and dealer.
  def start do
    IO.puts("Welcome to Blackjack!")
    deck = Deck.new()  # Creates a shuffled deck.
#    IO.puts("Deck before dealing:")
#    IO.inspect(deck) # Print the deck
    {player_hand, remaining_deck} = Deck.deal_hand(deck)  # Deals the player's hand.
    {dealer_hand, remaining_deck} = Deck.deal_hand(remaining_deck)  # Deals the dealer's hand.
    hands = [player_hand, dealer_hand]
    IO.inspect(hands)  # Prints the player's and dealer's hands for debugging.
    play_game(hands, remaining_deck)  # Starts the game loop.
  end

  # Main game loop where the player takes turns.
  defp play_game(hands, deck) do
    [player_hand, dealer_hand] = hands  # Extracts the player's and dealer's hands.

    # Displays the player's and dealer's hands.
    IO.puts("Your hand: #{format_hand(player_hand)}")
    IO.puts("Dealer's hand: #{format_hand(dealer_hand)}")

    # Displays the player's score.
    player_score = Hand.value(player_hand)
    IO.puts("Your score: #{player_score}")

    # If the player's score is 21, they win automatically.
    if player_score == 21 do
      IO.puts("Blackjack! You win!")
      play_again()  # Ask the player if they want to play again.
    else
      take_turns(player_hand, dealer_hand, deck)  # Otherwise, the player takes their turn.
    end
  end

  # Helper function to format the cards in a hand for display.
  defp format_hand(hand) do
    hand
    |> Enum.map(fn {rank} -> rank end)  # Extracts the rank from each card tuple.
    |> Enum.join(", ")  # Joins the ranks into a string.
  end

  # Handles the player's turn (either hit or stand).
  defp take_turns(player_hand, dealer_hand, deck) do
    IO.puts("Do you want to (h)it or (s)tand?")  # Asks the player for their action.
    action = IO.gets("") |> String.trim()  # Gets the player's input.

    case action do
      # If the player chooses to hit, a new card is dealt.
      "h" ->
        case deck do
          [] ->  # If the deck is empty, the game ends.
            IO.puts("The deck is empty!")
            determine_winner(player_hand, dealer_hand)  # Determine the winner.
          [new_card | remaining_deck] ->  # Deals a new card.
            IO.puts("You got: #{elem(new_card, 0)}")  # Displays the new card.
            new_hand = [new_card | player_hand]  # Adds the new card to the player's hand.
            IO.puts("Your hand: #{format_hand(new_hand)}")  # Displays the updated hand.
            new_score = Hand.value(new_hand)  # Calculates the new score.
            IO.puts("Your score: #{new_score}")  # Displays the new score.
            if new_score > 21 do
              IO.puts("You bust! You lose!")  # If the player busts, they lose.
              play_again()  # Ask if they want to play again.
            else
              take_turns(new_hand, dealer_hand, remaining_deck)  # Player takes another turn.
            end
        end
      # If the player chooses to stand, the dealer's turn starts.
      "s" ->
        dealer_turn(dealer_hand, deck, player_hand)
      # If the input is invalid, prompt again.
      _ ->
        IO.puts("Invalid option. Please choose (h)it or (s)tand.")
        take_turns(player_hand, dealer_hand, deck)
    end
  end

  # Handles the dealer's turn based on Blackjack rules.
  defp dealer_turn(dealer_hand, deck, player_hand) do
    IO.puts("Dealer's hand: #{format_hand(dealer_hand)}")
    IO.puts("Dealer's score: #{Hand.value(dealer_hand)}")

    if Hand.value(dealer_hand) < 17 do  # Dealer must hit if score is less than 17.
      IO.puts("Dealer hits.")
      case deck do
        [] ->  # If the deck is empty, the game ends.
          IO.puts("The deck is empty!")
          determine_winner(player_hand, dealer_hand)
        [new_card | remaining_deck] ->  # Deals a new card to the dealer.
          IO.puts("Dealer got: #{elem(new_card, 0)}")
          dealer_turn([new_card | dealer_hand], remaining_deck, player_hand)  # Dealer continues their turn.
      end
    else  # If the dealer's score is 17 or more, they stand.
      determine_winner(player_hand, dealer_hand)
    end
  end

  # Determines the winner based on the final scores of the player and dealer.
  defp determine_winner(player_hand, dealer_hand) do
    player_score = Hand.value(player_hand)  # Calculates the player's final score.
    dealer_score = Hand.value(dealer_hand)  # Calculates the dealer's final score.

    # Displays the final scores.
    IO.puts("Final scores:")
    IO.puts("Your score: #{player_score}")
    IO.puts("Dealer's score: #{dealer_score}")

    # Decides who wins based on the scores.
    cond do
      player_score > 21 -> IO.puts("You bust! You lose.")
      dealer_score > 21 -> IO.puts("Dealer busts! You win!")
      player_score > dealer_score -> IO.puts("You win!")
      player_score < dealer_score -> IO.puts("You lose.")
      true -> IO.puts("It's a tie!")
    end

    play_again()  # Asks if the player wants to play again.
  end

  # Asks the player if they want to play again.
  defp play_again do
    IO.puts("\nDo you want to play again? (y/n)")
    answer = IO.gets("") |> String.trim()

    case answer do
      "y" -> start()
      "n" -> IO.puts("Thanks for playing!")
      _ ->
        IO.puts("Invalid option. Please choose (y)es or (n)o.")
        play_again()
    end
  end
end

Game.start()
