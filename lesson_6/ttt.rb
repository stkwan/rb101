INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],  # cols
                 [1, 5, 9], [3, 5, 7]]             # diag
MAX_WINS = 3
SCORES = { player: 0, computer: 0 }

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  prompt("You are #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}.")
  puts ""
  puts "      |      |"
  puts "   #{brd[1]}  |   #{brd[2]}  |   #{brd[3]}"
  puts "      |      |"
  puts "------+------+------"
  puts "      |      |      "
  puts "   #{brd[4]}  |   #{brd[5]}  |   #{brd[6]}"
  puts "      |      |      "
  puts "------+------+------"
  puts "      |      |      "
  puts "   #{brd[7]}  |   #{brd[8]}  |   #{brd[9]}"
  puts "      |      |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board #=> {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ",...9=>" "}
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_peice!(brd) # put a bang b/c it mutates board
  square = ""
  loop do
    prompt("Choose a square: (#{joinor(empty_squares(brd))})")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def joinor(arr, delimiter=", ", word="or")
  case arr.size
  when 0 then ''
  when 1 then arr[0]
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# rubocop:disable Metrics/CyclomaticComplexity,Metrics/MethodLength
def computer_places_peice!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end
  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    end
  end
  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def increment_scores(winner)
  if winner == "Player"
    SCORES[:player] += 1
  elsif winner == "Computer"
    SCORES[:computer] += 1
  end
end

def display_scores
  prompt("SCORES: Player: #{SCORES[:player]} | Computer: #{SCORES[:computer]}")
end

def max_wins_reached?
  SCORES[:player] == MAX_WINS || SCORES[:computer] == MAX_WINS
end

def reset_scores
  SCORES[:player] = 0
  SCORES[:computer] = 0
end

loop do
  board = initalize_board
  loop do
    display_board(board)
    player_places_peice!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_peice!(board)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round!"
    increment_scores(detect_winner(board))
  else
    prompt "This round is a tie!"
  end
  display_scores
  if max_wins_reached?
    prompt("#{detect_winner(board)} wins the game!")
    prompt("Play again? (y or n)")
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
  if max_wins_reached? == false
    prompt("Press Enter for next round...")
    continue = gets.chomp
    next if continue == "/n"
  end
  reset_scores if max_wins_reached?
end

prompt("Thanks for playing Tic Tac Toe!")
