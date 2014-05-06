# Tic Tac Toe Game


class TicTacToe

  def initialize(player1, player2)
    player1.mark = "[O]"
    player2.mark = "[X]"
    @number_of_games = 0
    
    puts "Welcome in the TicTacToe game. "\
         "#{player1.name.capitalize}'s mark is 'O' " \
         "and #{player2.name.capitalize}'s mark is 'X'. "\
         "Your move is a combination of column and row names, e.g. A2 or C3. "\
         "Let's get started!"

    next_game(player1, player2)
  end



  def next_game(player1, player2)
    @number_of_games += 1
    @number_of_games.odd? ? game(player1, player2) : game(player2, player1)

    puts "Do you want to play again? yes/no"
    next_game_question = gets.chomp
    next_game(player1, player2) if next_game_question.downcase == 'yes'
  end

  def game(player1, player2)
    @moves = 1
    @status = "on"
    @outcome = "draw"

    create_board
    show_board

    game_loop(player1, player2)

    win_lose_updater(player1, player2)
  end

  def game_loop(player1, player2)
    while @moves < 10
      move_handler(player1, player2)
      puts ''
      show_board
      win_lose_checker
      if @status == "off"
        @outcome = "win" if @moves.odd?
        @outcome = "lose" if @moves.even?
        break
      end
      @moves += 1
    end
  end



  def move_handler(player1, player2)
    if @moves.odd?
      puts "#{player1.name}'s move"
      move = gets.chomp
      player_move(move, player1.mark)
    else
      puts "#{player2.name}'s move"
      move = gets.chomp
      player_move(move, player2.mark)
    end
  end

  def player_move(move, player_mark)
    return unless true == legal_move?(move, player_mark)
    column, row = move_into_box(move)

    if @board[column][row] != '[_]'
      puts "This box is used. Choose other one."
      move = gets.chomp
      player_move(move, player_mark)
    else
      @board[column][row] = player_mark
    end
  end

  def legal_move?(move, player_mark)
    a, b = move.upcase.split('')
    if (a == 'A' || a == 'B' || a == 'C') && (b == '1' || b == '2' || b == '3') && (move.size == 2)
      return true
    else
      puts "Illegal move. Try again"
      next_move = gets.chomp
      player_move(next_move, player_mark)
    end
  end

  def move_into_box(move)
    a, b = move.upcase.split('')

    row = 
      case a
      when "A" then 0
      when "B" then 1
      when "C" then 2
      end

    column = 
      case b
      when '1' then 0
      when '2' then 1
      when '3' then 2
      end

    return [column, row]
  end



  def create_board
    @board = [
      %w([_] [_] [_]),
      %w([_] [_] [_]),
      %w([_] [_] [_]),
    ]
  end

  def show_board
    puts "+  A  B  C"
    line_number = 0
    @board.each do |line|
      print "#{line_number += 1} "
      line.each { |box| print box }
      puts ''
    end
  end


# The scary one
  def win_lose_checker
    end_game = true if @board[0][0] != '[_]' && (@board[0][0] == @board[0][1] && @board[0][0] == @board[0][2])
    end_game = true if @board[1][0] != '[_]' && (@board[1][0] == @board[1][1] && @board[1][0] == @board[1][2])
    end_game = true if @board[2][0] != '[_]' && (@board[2][0] == @board[2][1] && @board[2][0] == @board[2][2])
    end_game = true if @board[0][0] != '[_]' && (@board[0][0] == @board[1][0] && @board[0][0] == @board[2][0])
    end_game = true if @board[0][1] != '[_]' && (@board[0][1] == @board[1][1] && @board[0][1] == @board[2][1])
    end_game = true if @board[0][2] != '[_]' && (@board[0][2] == @board[1][2] && @board[0][2] == @board[2][2])
    end_game = true if @board[0][0] != '[_]' && (@board[0][0] == @board[1][1] && @board[1][1] == @board[2][2])
    end_game = true if @board[2][0] != '[_]' && (@board[2][0] == @board[1][1] && @board[1][1] == @board[0][2])

    @status = 'off' if end_game == true
  end

  def win_lose_updater(player1, player2)
    if @outcome == "win"
      player1.wins += 1
      player2.loses += 1
      puts "#{player1.name.capitalize} wins!"
    elsif @outcome == "lose"
      player1.loses += 1
      player2.wins += 1
      puts "#{player2.name.capitalize} wins!"
    else
      player1.draws += 1
      player2.draws += 1
      puts "Draw!"
    end
  end
end




class Player
  attr_accessor :mark, :wins, :loses, :draws
  attr_reader :name
  
  def initialize(name)
    @name = name
    @wins = 0
    @loses = 0
    @draws = 0
  end

  def record 
    puts "#{self.name} won #{@wins}, lost #{@loses}, and drawn #{@draws} games."
  end

end




#Example:

# mark = Player.new("Mark")
# suzy = Player.new("Suzy")
# game1 = TicTacToe.new(mark, suzy)
# ----
# mark.record*
# *record won't work if lines above are just uncommented