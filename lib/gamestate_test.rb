# frozen_string_literal: true

# script to run only the gamestate without window
# doubles as a terminal veiw of game

require_relative 'game_state'

play = true
game = GameState.new('Balto', 'Dolfo')
game.grid_print
until play == false
  game.input_request
  game.grid_print
end
