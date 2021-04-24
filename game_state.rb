# frozen_string_literal: true

######################
# when a new GameState is created playernames will be logged into a Hash
# logic and data storage is done here
class GameState
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @@counter = 1
    # player names and score in hash
    @players = {
      player1 => 0,
      player2 => 0
    }
    # a way of storing locations
    @grid_hash = {
     # col:  0   1   2
      row1: ['', '', ''], # top
      row2: ['', '', ''], # mid
      row3: ['', '', '']  # bot
    }
  end

  ###############
  ##### OwO #####
  ###############

  def place_maker(locarry)
    row = locarry(0).to_o
    col = locarry(1).to_i

    # player 1 #
    if @@counter.odd?
      row_arry = @grid_hash[row]


      # player 2 #
    else
      row_arry = @grid_hash[row]

    end
    counter_up
  end

  def input_request
    puts ' row1, row2, or row3?'
    row = gets.chomp
    puts ' col 1, 2, or 3?'
    col = gets.chomp
    locarry = [row, col]
    return locarry
  end

  def grid_print
    puts ' col:  0   1   2'
    @grid_hash.each do |row, val|
      puts "#{row}: #{val}"
    end
    puts ''
  end

  def counter
    @@counter
  end

  def counter_up
    @@counter += 1
  end

  def players
    @players
  end

  def player
    @player = if @@counter.odd?
                @player1
              else
                @player2
              end
    @player
  end

  ######################

  def win?
    win = false unless condition

    end
  end

end
