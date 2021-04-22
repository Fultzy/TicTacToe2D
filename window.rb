# frozen_string_literal: true

# list of window controls and objects to draw
require 'ruby2d'

class Window
  # window att
  def window
    set width: 800, height: 600
    set background: '#5F5F6F'
    set title: 'Ruby TicTacToe'
    intro
    show
  end

  #### objects ####
  def intro
    Text.new("Fultzy's TicTacToe!",
             x: 15, y: 25, z: 2,
             size: 90,
             rotate: 5,
             color: 'gray')
    Text.new('With RUBY! :D',
             x: 50, y: 250, z: 2,
             size: 28,
             rotate: 5,
             color: 'gray')
    Text.new("Press 'space' to continue",
              x: 50, y: 550, z: 2,
              size: 18,
              rotate: 0,
              color: 'gray')
    Image.new('grid.jpg',
              x: 100, y: 120, z: 1,
              color: '#5F5F6F')
  end

  # top of text, notify which players turn it is
  def top_text(player = 'Name_error')
    Square.new(width: 700, x: 50,
               height: 15, y: 15, z: 3,
               color: 'silver')
    Text.new("Player ##{player}'s turn.",
             x: 120, y: 20, z: 4,
             color: 'black',
             size: 20)
  end

  def score_board(player1, player2)
    Square.new(width: 240, x: 550,
               height: 580, y: 10, z: 2,
               color: 'silver')
    Text.new('Score:')
    Text.new("#{player1}: #{player1.score}")
    Text.new("#{player2}: #{player2.score}")
  end

  # display of TicTacToe grid, drawn after intro
  def grid
    Image.new('grid.jpg')
  end

  on :mouse_down do |event|
    # x and y coordinates of the mouse button event
    puts event.x, event.y

    # Read the button event
    case event.button
    when :left
      # Left mouse button pressed down
    when :right
      # Right mouse button pressed down
    end
  end
  # request a key be pressed
  def continue?
    on :key_down
    true
  end

end
