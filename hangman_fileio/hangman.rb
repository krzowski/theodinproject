require 'csv'

class Hangman
  attr_accessor :chances_left, :letters_used, :word, :word_encrypted

  def initialize
    set_variables

    puts "Welcome in the Hangman game\nDo you want to play a " \
    "new game or load one?\nwrite 'new' or 'load'"
    answer = gets.chomp
    if answer == "new"
      game
    elsif answer == "load"
      load_game
    end
  end


  def game
    drawing
    game_loop

    puts "\nDo you want to play again? yes/no"
    answer = gets.chomp
    if answer == 'yes'
      set_variables
      game
    end      
  end

  def game_loop
    while @chances_left > 0 || @guess == @word
      player_guess
      drawing
      if @word_encrypted == @word.split('').join(" ")
        puts "Congratulations! You guessed the word!"
        break
      end
    end
  end

  def set_variables
    @chances_left = 6
    @letters_used = ""
    word_setter
    encrypt_word
    @guess = ''
  end

# Choosing a random word from dictionary
  def word_setter
    @word = File.new("5desk.txt", "r").readlines[rand(61406)][0..-2].upcase
    word_setter unless @word.length > 4 && @word.length < 13
  end

  def encrypt_word
    @word_encrypted = @word.split('').join(" ").gsub(/\w/, '_')
  end



  def player_guess
    puts "\nChoose the letter or guess a word / type 'save' to save the game"
    @guess = gets.chomp.upcase
    word_update
  end


# Dealing with player's choice
  def word_update
    if @guess == 'SAVE'
      save_game
    elsif @guess.length == 0
      puts "\nYou didn't type anything"
      player_guess
    elsif @guess.length == 1
      if @letters_used.include? @guess
        puts "\nYou already used this letter. Type another one"
        player_guess
      elsif @word.include? @guess
        puts "\nGood Guess"
        @letters_used += @guess
        encrypted_word_update
      else
        puts "\nBad Guess"
        @letters_used += @guess
        @chances_left -= 1
      end
    else
      if @guess == @word
        @word_encrypted = @word.split('').join(" ")
      else
        puts "\nBad Guess"
        @chances_left -= 1
      end
    end
  end

  def encrypted_word_update
    new_word = ""
    old_word = @word_encrypted.split(" ").join
    @word.split('').each_with_index do |letter, index|
      if @guess == letter
        new_word += " #{letter}"
      elsif "_" != old_word[index]
        new_word += " #{old_word[index]}"
      else
        new_word += " _"
      end
    end
    @word_encrypted = new_word[1..-1]
  end



  def save_game
    Dir.mkdir('saves') unless Dir.exist? "saves"
    puts "write a name of your save"
    name = gets.chomp
    csv = File.open('saves/saved_games.csv', "ab")
    csv.write("#{name},#{@chances_left},#{@letters_used},#{@word},#{@word_encrypted}\n")
    csv.close
  end

  def load_game
    if !(File.exist?("saves/saved_games.csv"))
      puts "There are no saved games\nNew game"
      game
    end

    puts "\nSaved Games:\n"
    saves = CSV.read("saves/saved_games.csv")
    saves.each_with_index do |save, index| 
      puts "#{index + 1}. #{save[0]}"
    end

    load_save(saves)

    game
  end

  def load_save(saves)
    number = which_save(saves.size)
    @chances_left = saves[number][1].to_i
    @letters_used = saves[number][2]
    @word = saves[number][3]
    @word_encrypted = saves[number][4]
    puts "#{saves[number][0]} loaded"
  end

  def which_save(number_of_saves)
    puts "\nput the number of the save you want to continue"
    answer = gets.chomp.to_i
    if answer < 1 || answer > number_of_saves
      puts "There's no save no.#{answer}."
      which_save(number_of_saves)
    else
      return answer - 1
    end
  end


  def drawing
    if @chances_left == 6
      puts %Q(\n          #===#
          |   |
          |               #{@word_encrypted}
          |               
          |               #{@chances_left} more chances
          |
        ------ )
    elsif @chances_left == 5
      puts %Q(\n          #===#
          |   |
          |   o           #{@word_encrypted}
          |               
          |               #{@chances_left} more chances
          |
        ------ )
    elsif @chances_left == 4
      puts %Q(\n          #===#
          |   |
          |   o           #{@word_encrypted}
          |   |            
          |               #{@chances_left} more chances
          |
        ------ )
    elsif @chances_left == 3
      puts %Q(\n          #===#
          |   |
          |  \\o           #{@word_encrypted}
          |   |            
          |               #{@chances_left} more chances
          |
        ------ )
    elsif @chances_left == 2
      puts %Q(\n          #===#
          |   |
          |  \\o/          #{@word_encrypted}
          |   |            
          |               #{@chances_left} more chances
          |
        ------ )
    elsif @chances_left == 1
      puts %Q(\n          #===#
          |   |
          |  \\o/          #{@word_encrypted}
          |   |            
          |  /            #{@chances_left} more chance
          |
        ------ )
    else
      puts %Q(\n          #===#
          |   |
          |  \\o/          #{@word_encrypted}
          |   |            
          |  / \\          You lost! The word was #{@word}
          |
        ------ )
    end
  end

end

Hangman.new