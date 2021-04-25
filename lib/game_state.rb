# frozen_string_literal: true

######################
# when a new GameState is created playernames will be logged into a Hash
# logistics & data storage is done here
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
      # col:       1    2    3
      '1' => [' ', ' ', ' '], # top
      '2' => [' ', ' ', ' '], # mid
      '3' => [' ', ' ', ' ']  # bot
    }
  end

  ###############
  ##### OwO #####
  ###############

  ######################
  # math vs raw mouse event locations
  def locatinator(x, y)
    y_out = row_case(y)
    x_out = col_case(x)
    place_marker(x_out, y_out)
  end

  def row_case(x)
    # p "x: #{x}"
    unless x.to_i < 100
      if (100..266).include? x
        '1'
      elsif (267..433).include? x
        '2'
      elsif (434..600).include? x
        '3'
      else
        p 'x: out of area'
      end
    end
  end

  def col_case(y)
    # p "y: #{y}"
    unless y.to_i < 20
      if (20..191).include? y
        1
      elsif (192..363).include? y
        2
      elsif (364..535).include? y
        3
      else
        p 'y: out of area'
      end
    end
  end

  ######################
  # opens the grid hash and replaces the value within
  def place_marker(x, y)
    val = x.to_i - 1
    key = y
    row_arry = @grid_hash[key]
    if row_arry[val] == ' '
      if @@counter.odd?
        # player 1 #
        row_arry[val] = 'x'
        end_turn
      else
        # player 2 #
        row_arry[val] = 'o'
        end_turn
      end
    else
      p 'location taken'
    end
  end

  ######################

  def clear_grid
    @@couter = 1
    @grid_hash = {
      # col:       1    2    3
      '1' => [' ', ' ', ' '], # top
      '2' => [' ', ' ', ' '], # mid
      '3' => [' ', ' ', ' ']  # bot
    }
    puts ' ### grid cleared ###'
    grid_print
  end

  def end_turn
    grid_print
    win?
    counter_up
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
  # win condition check
  def win?
    @@counter == 6
  end

  ######################
  # allows for input from terminal
  def input_request
    puts ' row 1, 2, or 3?'
    row = gets.chomp
    puts ' col 1, 2, or 3?'
    col = gets.chomp
    place_marker(row, col)
  end

  def grid_print
    puts "turn: #{@@counter}"
    puts 'col #:   1    2    3'
    @grid_hash.each do |row, val|
      puts "row #{row}: #{val}"
    end
    puts ''
  end
end
