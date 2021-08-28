
# rubocop:disable Style/GlobalVars
MAX_WINS = 5

game_data = { player: {hand: [],
                       total: 0,
                       score: 0},
              dealer: {hand: [],
                       total: 0,
                       score: 0}
             }                        

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  faces = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  suits = %w(hearts diamonds clubs spades)
  deck = []
  faces.each do |face|
    suits.each do |suit|
      deck << [face, suit]
    end
  end
  deck
end

def shuffle(deck)
  deck.shuffle!
end

def welcome
  prompt("WELCOME TO TWENTY-ONE!")
  prompt("----------------------")
  prompt("Game Instructions:")
  prompt("You will be playing 1:1 versus the Dealer.")
  prompt("The goal is to get as close to 21 without going over.")
  prompt("Dealer must hit (add a card) on 16 or less.")
  prompt("Numbered cards are thier own value. (i.e. 7 of hearts = 7)")
  prompt("J = Jack, K = King, Q = Queen are worth 10 a peice.")
  prompt("A = Ace is worth 1 or 11")
  prompt("The first to win 5 rounds is the winner!")
  prompt("Press Enter to start!")
  gets
end

def deal_cards(deck, to_player, to_dealer)
  2.times { to_player << deck.pop }
  2.times { to_dealer << deck.pop }
end

def card_to_string(card)
  "#{card[0]} of #{card[1]}"
end

def get_card_value(card)
  if card[0].to_i != 0
    card[0].to_i
  elsif ["J", "Q", "K"].include?(card[0]) 
    10
  elsif card[0] == "A"
    11
  end
end

# rubocop:disable Metrics/MethodLength
def get_hand_value(hand)
  sum = 0
  hand.each do |card|
    sum += get_card_value(card)
  end
  num_aces_in_hand = 0
  hand.each do |card|
    if card[0] == "A"
      num_aces_in_hand += 1
    end
  end
  while sum > 21 && num_aces_in_hand != 0
    num_aces_in_hand -= 1
    sum -= 10
    break if num_aces_in_hand == 0
  end
  sum
end

def player_option(deck, hand)
  loop do
    prompt("Your current total is #{get_hand_value(hand)}.")
    break if busted?(hand)
    prompt("Would you like to hit or stay? (h/s)")
    answer = gets.chomp
    if answer == 'h'
      hand << deal_another_card(deck)
      prompt("You got a (#{card_to_string(hand[-1])}) added to your hand.")
      next
    elsif answer == 's'
      break
    else
      prompt("Invalid response, try again.")
      next
    end
  end
end
# rubocop:enable Metrics/MethodLength

def dealer_option(deck, hand)
  prompt("Dealer shows (#{card_to_string(hand[0])}) and (#{card_to_string(hand[1])}).")
  while get_hand_value(hand) < 17
    hand << deal_another_card(deck)
    prompt("Dealer hits and (#{card_to_string(hand[-1])}) was added to hand.")
    prompt("")
    prompt("Dealer current total is #{get_hand_value(hand)}.")
    break if busted?(hand)
  end
end

def busted?(hand)
  get_hand_value(hand) > 21
end

def deal_another_card(deck) # returns card from current_deck
  deck.pop
end

def reset_score(score)
  score = 0
end

# rubocop:disable Layout/LineLength
def compare_hands(p_total, d_total)
  prompt("You have #{p_total}. Dealer has #{d_total}.")
  if p_total > d_total &&
     p_total <= 21 &&
     d_total <= 21
    prompt("YOU WIN!")
    return "player"
  elsif p_total == d_total
    prompt("IT'S A DRAW!")
  else
    prompt("DEALER WINS!")
    return "dealer"
  end
end

def game_over?(score1, score2)
  score1 == MAX_WINS || score2 == MAX_WINS
end

def display_scores(score1, score2)
  prompt("SCORE:: Player: #{score1} | Dealer: #{score2}")
end

def win_prompt(score1, score2)
  if score1 == MAX_WINS
    prompt("YOU WON THE GAME!")
    prompt("GAME OVER.")
  elsif score2 == MAX_WINS
    prompt("DEALER WON THE GAME!")
    prompt("GAME OVER.")
  end
end

def play_again?
  loop do
    prompt("Play again? (y/n)")
    answer = gets.chomp
    if answer.downcase == "y"
      return "y"
    elsif answer.downcase == "n"
      return "n"
    else
      prompt("That's not a valid response")
    end
  end
end

# rubocop:enable Layout/LineLength

system "clear"
welcome

player_hand = game_data[:player][:hand]
player_score = game_data[:player][:score]
player_total = game_data[:player][:total]

dealer_hand = game_data[:dealer][:hand]
dealer_score = game_data[:dealer][:score]
dealer_total = game_data[:dealer][:total]

loop do
  system "clear"

  display_scores(player_score, dealer_score)
  prompt("")
  current_deck = initialize_deck
  shuffle(current_deck)
  deal_cards(current_deck, player_hand, dealer_hand)
  
  
  prompt("Dealer has (#{card_to_string(dealer_hand[0])}) and an unknown card.")
  prompt("You have (#{card_to_string(player_hand[0])}) and (#{card_to_string(player_hand[1])}).")
  prompt("")
  
  player_option(current_deck, player_hand)
  
  if busted?(player_hand)
    prompt("YOU BUSTED! DEALER WINS!")
    dealer_score += 1
  end
  
  unless busted?(player_hand) == true
    dealer_option(current_deck, dealer_hand)
  end
  
  player_total = get_hand_value(player_hand)
  dealer_total = get_hand_value(dealer_hand)
  
  if busted?(dealer_hand)
    prompt("DEALER BUSTED! YOU WIN!")
    player_score += 1
  end
  
  if busted?(player_hand) == false && busted?(dealer_hand) == false
    the_winner = compare_hands(player_total, dealer_total)
  end
  
  if the_winner == "player"
    player_score += 1
  elsif the_winner == "dealer"
    dealer_score += 1
  end
  
  display_scores(player_score, dealer_score)
  
  if game_over?(player_score, dealer_score)
    win_prompt(player_score, dealer_score)
    player_score = reset_score(player_score)
    dealer_score = reset_score(dealer_score)
  end
  
  if play_again? == "y"
    player_hand = []
    dealer_hand = []
    player_total = 0
    dealer_total = 0
    next
  else
    break
  end
end

prompt("Thanks for playing Twenty-One!")
# rubocop:enable Style/GlobalVars
