# frozen_string_literal: true

# repo: git@github.com:Fultzy/TicTacToe2D.git

require './lib/window'
require './lib/game_state'

# tic tac toe game project from 'the oedin project' presented in ruby2d
# this project was meant to be presented within the terminal but id like
# to figure out how to visualize code in graphical window.

######################
# creation of new game state as game
game = GameState.new('Foo', 'Bar')

######################
# creation of new window as view
veiw = Window.new

######################
# intro screen being drawn
veiw.window
@intro = true

intro_text =
  Text.new("Fultzy's TicTacToe!",
           x: 15, y: 25, z: 2,
           size: 90,
           rotate: 5,
           color: 'gray')
intro_text2 =
  Text.new('With RUBY2D! :D',
           x: 50, y: 250, z: 2,
           size: 28,
           rotate: 5,
           color: 'gray')
intro_stone =
  Image.new('./lib/images/ruby_stone.png',
            x: 100, y: 120, z: 1,
            color: '#6F6F8F')
continue_text =
  Text.new("Press 'space' to continue",
           x: 150, y: 550, z: 2,
           size: 18,
           rotate: 0,
           color: 'gray')

######################
#### Controls ####
# A key was pressed
on :key_down do |event|
  if event.type == :down
    case event.key

    # to remove intro objects from veiw
    when 'space'
      if @intro == true
        @intro = false
        intro_text.remove
        intro_text2.remove
        continue_text.remove
        intro_stone.remove

    # build next page on removal of intro
        veiw.top_text_box
        veiw.score_board
        veiw.scores(game.players)
        veiw.player_name(game.player)

        Image.new('./lib/images/ruby_stone.png',
                  color: '#6F6F9F',
                  height: 500, x: 0, y: 80, z: 1)
        Image.new('./lib/images/grid.png',
                  height: 500, width: 514,
                  x: 20, y: 95, z: 2)
      else
        #clear the play mat of markers
        game.clear_grid
      end
    # will exit the application
    when 'escape'
      p 'i miss you Dolfo'
      exit
    end
  end
end

######################
# mouse interaction, event, and location.

on :mouse_down do |event1|
  clickarry = [event1.x, event1.y]
  case event1.button
  when :left
    if @intro == false
      veiw.sticker(game.counter, clickarry)
      game.locatinator(event1.x, event1.y)
      veiw.clear_text
      veiw.player_name(game.player)
    else
      p "left button yay!"

    end
  when :right
    # do something cool
    p "right button yay!"
  end
end



######################
#### graphics loop? ####
update do
end

show
