VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

WINNING_PAIRS = { rock: ['scissors', 'lizard'],
                  paper: ['rock', 'spock'],
                  scissors: ['paper', 'lizard'],
                  lizard: ['spock', 'paper'],
                  spock: ['rock', 'scissors'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  if WINNING_PAIRS[player.to_sym].include?(computer)
    prompt("You won this round!")
  elsif WINNING_PAIRS[computer.to_sym].include?(player)
    prompt("Computer won this round!")
  else
    prompt("It's a tie this round!")
  end
end

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("------------------------------------------------")
prompt("You'll be playing against the computer.")
prompt("The first to 3 wins will be declared the winner!")

player_score = 0
computer_score = 0

loop do
  if player_score == 3
    prompt("You won the game! Enter Y to play again or any key to quit.")
    answer = gets.chomp
    player_score = 0
    computer_score = 0
    break unless answer.downcase.start_with?('y')
  elsif computer_score == 3
    prompt("Computer won the game! Enter Y to play again or any key to quit.")
    answer = gets.chomp
    computer_score = 0
    player_score = 0
    break unless answer.downcase.start_with?('y')
  end
  
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase()
    
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  
  computer_choice = VALID_CHOICES.sample
  system "clear"
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  
  display_results(choice, computer_choice)
  
  if WINNING_PAIRS[choice.to_sym].include?(computer_choice)
    player_score += 1
  elsif WINNING_PAIRS[computer_choice.to_sym].include?(choice)
    computer_score += 1
  end
  
  prompt("Player score: #{player_score} | Computer score: #{computer_score}")
  prompt("------------------------------------------------")
end

prompt("Thank you for playing. Good bye!")
