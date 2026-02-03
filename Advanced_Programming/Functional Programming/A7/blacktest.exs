defmodule Card do
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

  def ace_value_with(value_of_rest) do
    if value_of_rest > 10, do: 1, else: 11
  end

  def from_rank(rank) do
    {rank}
  end

  def value({rank}) do
    Enum.find(@value_list, fn {r, _} -> r == rank end)
    |> elem(1)
  end
end

defmodule Hand do
  def value(hand) do
    map = hand |> Enum.group_by(fn(c) -> elem(c, 0) == "Ace" end)
    aces = map[true] || []
    others = map[false] || []

    others_val = others |> Enum.map(&Card.value/1) |> Enum.sum
    value_with_aces(length(aces), others_val)
  end

  defp value_with_aces(0, others_val), do: others_val
  defp value_with_aces(num_aces, others_val) do
    val_as_ones = others_val + num_aces
    if val_as_ones <= 11, do: val_as_ones + 10, else: val_as_ones
  end
end

defmodule Deck do
  def new do
    ranks = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]

    ranks
    |> Enum.flat_map(fn rank ->
      List.duplicate(Card.from_rank(rank), 4)
    end)
    |> Enum.shuffle()
  end

  def deal_hand(deck) do
    {hand, remaining_deck} = Enum.split(deck, 2)
    {hand, remaining_deck}
  end
end

defmodule Game do
  def start do
    IO.puts("Welcome to Blackjack!")
    deck = Deck.new()
#    IO.puts("Deck before dealing:")
#    IO.inspect(deck) # Print the deck
    {player_hand, remaining_deck} = Deck.deal_hand(deck)
    {dealer_hand, remaining_deck} = Deck.deal_hand(remaining_deck)
    hands = [player_hand, dealer_hand]
    IO.inspect(hands)
    play_game(hands, remaining_deck)
  end

  defp play_game(hands, deck) do
    [player_hand, dealer_hand] = hands

    IO.puts("Your hand: #{format_hand(player_hand)}")
    IO.puts("Dealer's hand: #{format_hand(dealer_hand)}")


    player_score = Hand.value(player_hand)
    IO.puts("Your score: #{player_score}")

    if player_score == 21 do
      IO.puts("Blackjack! You win!")
      play_again()
    else
      take_turns(player_hand, dealer_hand, deck)
    end
  end

  defp format_hand(hand) do
    hand
    |> Enum.map(fn {rank} -> rank end)
    |> Enum.join(", ")
  end

  defp take_turns(player_hand, dealer_hand, deck) do
    IO.puts("Do you want to (h)it or (s)tand?")
    action = IO.gets("") |> String.trim()

    case action do
      "h" ->
        case deck do
          [] ->
            IO.puts("The deck is empty!")
            determine_winner(player_hand, dealer_hand)
          [new_card | remaining_deck] ->
            IO.puts("You got: #{elem(new_card, 0)}")
            new_hand = [new_card | player_hand]
            IO.puts("Your hand: #{format_hand(new_hand)}")
            new_score = Hand.value(new_hand)
            IO.puts("Your score: #{new_score}")
            if new_score > 21 do
              IO.puts("You bust! You lose!")
              play_again()
            else
              take_turns(new_hand, dealer_hand, remaining_deck)
            end
        end
      "s" ->
        dealer_turn(dealer_hand, deck, player_hand)
      _ ->
        IO.puts("Invalid option. Please choose (h)it or (s)tand.")
        take_turns(player_hand, dealer_hand, deck)
    end
  end

  defp dealer_turn(dealer_hand, deck, player_hand) do
    IO.puts("Dealer's hand: #{format_hand(dealer_hand)}")
    IO.puts("Dealer's score: #{Hand.value(dealer_hand)}")

    if Hand.value(dealer_hand) < 17 do
      IO.puts("Dealer hits.")
      case deck do
        [] ->
          IO.puts("The deck is empty!")
          determine_winner(player_hand, dealer_hand)
        [new_card | remaining_deck] ->
          IO.puts("Dealer got: #{elem(new_card, 0)}")
          dealer_turn([new_card | dealer_hand], remaining_deck, player_hand)
      end
    else
      determine_winner(player_hand, dealer_hand)
    end
  end

  defp determine_winner(player_hand, dealer_hand) do
    player_score = Hand.value(player_hand)
    dealer_score = Hand.value(dealer_hand)

    IO.puts("Final scores:")
    IO.puts("Your score: #{player_score}")
    IO.puts("Dealer's score: #{dealer_score}")

    cond do
      player_score > 21 -> IO.puts("You bust! You lose.")
      dealer_score > 21 -> IO.puts("Dealer busts! You win!")
      player_score > dealer_score -> IO.puts("You win!")
      player_score < dealer_score -> IO.puts("You lose.")
      true -> IO.puts("It's a tie!")
    end

    play_again()
  end

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
