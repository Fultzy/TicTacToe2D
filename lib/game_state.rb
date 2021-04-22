# frozen_string_literal: true

# tic tac toe game project from 'the oedin project' presented in ruby2d
# this project was meant to be presented within the terminal but id like
# to figure out how to visualize code in graphical window.

class GameState
  def initialize(plyr1 = '1', plyr2 = '2')
    @counter = 1
    @player1 = plyr1
    @player2 = plyr2
  end

  def play_turn
    @counter += 1
  end

  ##### OwO #####

  def continue?

  def player
    @counter.is_odd? ? @player_num = @player1 : @player2
    p @player_num
  end
end
