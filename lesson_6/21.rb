# 1) Initialize a deck

PLAYER_HAND = []
DEALER_HAND = []

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  faces = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  suits = %w(hearts diamonds clubs spades)
  deck = []
  faces.each do |face|
    suits.each do |suit|
      deck << "#{face} of #{suit}"
    end
  end
  deck
end

def shuffle(deck)
  deck.shuffle!
end

def deal_cards(deck)
  2.times { |n| PLAYER_HAND << deck.pop }
  2.times { |n| DEALER_HAND << deck.pop }
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

def get_hand_value(hand)
  sum = 0
  hand.each do |crd|
    sum += get_card_value(crd)
  end
  sum
end

def player_option(deck)
  loop do
    prompt("Your current total is #{get_hand_value(PLAYER_HAND)}")
    break if busted?(PLAYER_HAND)
    prompt("Would you like to hit or stay? (h/s)")
    answer = gets.chomp
    
    if answer == 'h'
      PLAYER_HAND << deal_another_card(deck)
      prompt("You got a #{PLAYER_HAND.last} added to your hand.")
      next
    elsif answer == 's'
      break
    else
      prompt("Invalid response, try again.")
      next
    end
  end
end


def dealer_option(deck)
  prompt("Dealer shows #{DEALER_HAND[0]} and #{DEALER_HAND[1]}.")
  
  while get_hand_value(DEALER_HAND) < 17
    DEALER_HAND << deal_another_card(deck)
    prompt("Dealer hit and #{DEALER_HAND.last} was added to hand.")
    prompt("Dealer current total is #{get_hand_value(DEALER_HAND)}")
    break if busted?(DEALER_HAND)
  end
end


def busted?(hand)
  if get_hand_value(hand) > 21
    return true
  else
    return false
  end
end


def deal_another_card(deck) #returns card from current_deck
  deck.pop
end

def compare_hands(hand1, hand2)
  prompt("You have #{get_hand_value(hand1)}. Dealer has #{get_hand_value(hand2)}.")
  if get_hand_value(hand1) > get_hand_value(hand2) && 
     get_hand_value(hand1) <= 21 && 
     get_hand_value(hand2) <= 21
    prompt("YOU WIN!")
  elsif get_hand_value(hand1) == get_hand_value(hand2)
    prompt("IT'S A DRAW!")
  else
    prompt("DEALER WINS!")
  end
end


loop do
  system "clear"
  current_deck = initialize_deck
  shuffle(current_deck)
  deal_cards(current_deck)
  
  prompt("Dealer has #{DEALER_HAND[0]} & an unknown card.")
  prompt("You have #{PLAYER_HAND[0]} & #{PLAYER_HAND[1]}.")
  prompt("")
  
  
    player_option(current_deck)
    
    if busted?(PLAYER_HAND)
      prompt("You BUSTED! Dealer wins this round!")
    end
    
    unless busted?(PLAYER_HAND) == true
      dealer_option(current_deck)
    end
    
    if busted?(DEALER_HAND)
      prompt("Dealer BUSTED! You win this round!")
    end
    
    if busted?(PLAYER_HAND) == false &&
      busted?(DEALER_HAND) == false
      compare_hands(PLAYER_HAND, DEALER_HAND)
    end
    
  prompt("Play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase == "y"
  
  PLAYER_HAND = []
  DEALER_HAND = []
end

prompt("Thanks for playing Twenty-One!")
  
 
  
 
  

    
  
  


