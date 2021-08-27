# rubocop:disable Style/GlobalVars
$PLAYER_HAND = []
$DEALER_HAND = []
SCORES = { player: 0, dealer: 0 }
MAX_WINS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  faces = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  suits = %w(hearts diamonds clubs spades)
  deck = []
  faces.each do |face|
    suits.each do |suit|
      deck << "#{face} of #{suit}" # re-factor code? face point to integer?
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
  prompt("Numbered cards are thier own value. (i.e. 2 = 2)")
  prompt("J = Jack, K = King, Q = Queen are worth 10 a peice.")
  prompt("A = Ace is worth 1 or 11")
  prompt("The first to win 5 rounds is the winner!")
  prompt("Press Enter to start!")
  gets
end

def deal_cards(deck)
  2.times { $PLAYER_HAND << deck.pop }
  2.times { $DEALER_HAND << deck.pop }
end

def get_card_value(card)
  if card[0..1] == "10"
    10
  elsif card[0].to_i != 0
    card[0].to_i
  elsif "JQK".include?(card[0])
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
    if card.start_with?("A")
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

def player_option(deck)
  loop do
    prompt("Your current total is #{get_hand_value($PLAYER_HAND)}")
    break if busted?($PLAYER_HAND)
    prompt("Would you like to hit or stay? (h/s)")
    answer = gets.chomp
    if answer == 'h'
      $PLAYER_HAND << deal_another_card(deck)
      prompt("You got a #{$PLAYER_HAND.last} added to your hand.")
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

def dealer_option(deck)
  prompt("Dealer shows #{$DEALER_HAND[0]} and #{$DEALER_HAND[1]}.")
  while get_hand_value($DEALER_HAND) < 17
    $DEALER_HAND << deal_another_card(deck)
    prompt("Dealer hit and #{$DEALER_HAND.last} was added to hand.")
    prompt("")
    prompt("Dealer current total is #{get_hand_value($DEALER_HAND)}")
    break if busted?($DEALER_HAND)
  end
end

def busted?(hand)
  get_hand_value(hand) > 21
end

def deal_another_card(deck) # returns card from current_deck
  deck.pop
end

def reset_scores
  SCORES[:player] = 0
  SCORES[:dealer] = 0
end

# rubocop:disable Layout/LineLength
def compare_hands(hand1, hand2)
  prompt("You have #{get_hand_value(hand1)}. Dealer has #{get_hand_value(hand2)}.")
  if get_hand_value(hand1) > get_hand_value(hand2) &&
     get_hand_value(hand1) <= 21 &&
     get_hand_value(hand2) <= 21
    prompt("YOU WIN!")
    SCORES[:player] += 1
  elsif get_hand_value(hand1) == get_hand_value(hand2)
    prompt("IT'S A DRAW!")
  else
    prompt("DEALER WINS!")
    SCORES[:dealer] += 1
  end
end

def game_over?(score1, score2)
  score1 == MAX_WINS || score2 == MAX_WINS
end

def display_scores
  prompt("SCORE:: Player: #{SCORES[:player]} | Dealer: #{SCORES[:dealer]}")
end

def win_prompt
  if SCORES[:player] == MAX_WINS
    prompt("YOU WON THE GAME!")
    prompt("GAME OVER.")
  elsif SCORES[:dealer] == MAX_WINS
    prompt("DEALER WON THE GAME!")
    prompt("GAME OVER.")
  end
end
# rubocop:enable Layout/LineLength

system "clear"
welcome
loop do
  system "clear"
  display_scores
  prompt("")
  current_deck = initialize_deck
  shuffle(current_deck)
  deal_cards(current_deck)
  prompt("Dealer has #{$DEALER_HAND[0]} & an unknown card.")
  prompt("You have #{$PLAYER_HAND[0]} & #{$PLAYER_HAND[1]}.")
  prompt("")
  player_option(current_deck)
  if busted?($PLAYER_HAND)
    prompt("You BUSTED! DEALER WINS!")
    SCORES[:dealer] += 1
  end
  unless busted?($PLAYER_HAND) == true
    dealer_option(current_deck)
  end
  if busted?($DEALER_HAND)
    prompt("Dealer BUSTED! YOU WIN!")
    SCORES[:player] += 1
  end
  if busted?($PLAYER_HAND) == false && busted?($DEALER_HAND) == false
    compare_hands($PLAYER_HAND, $DEALER_HAND)
  end
  display_scores
  if game_over?(SCORES[:player], SCORES[:dealer])
    win_prompt
    reset_scores
  end
  prompt("Play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase == "y"
  $PLAYER_HAND = []
  $DEALER_HAND = []
end

prompt("Thanks for playing Twenty-One!")
# rubocop:enable Style/GlobalVars
