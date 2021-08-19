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
    prompt("You won!")
  elsif WINNING_PAIRS[computer.to_sym].include?(player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  
  computer_choice = VALID_CHOICES.sample
  
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  
  display_results(choice, computer_choice)
  
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
