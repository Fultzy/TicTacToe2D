# frozen_string_literal: true

# list of window controls and objects to draw
require 'ruby2d'

class Window
  ######################
  # window att
  def window
    set width: 800, height: 600
    set background: '#5F5F6F'
    set title: 'TicTacToe2D'
  end

  #### Objects ####

  ######################
  # top display of whos turn and containers for it
  def player_name(player)
    @player_turn = Text.new(
      "#{player}'s turn.",
      x: 180, y: 30, z: 10,
      color: 'black', size: 30)
  end

  def top_text_box
    Rectangle.new(width: 700, height: 60,
                  x: 50, y: 20, z: 4,
                  color: 'gray')
    Circle.new(x: 750, y: 50,
               radius: 30,
               sectors: 32,
               color: 'gray',
               z: 4)
    Circle.new(x: 50, y: 50,
               radius: 30,
               sectors: 32,
               color: 'gray',
               z: 4)
    # border shapes #
    Rectangle.new(width: 700, height: 70,
                  x: 50, y: 15, z: 3,
                  color: [0, 0, 0, 0.53])
    Circle.new(x: 750, y: 50,
               radius: 34,
               sectors: 32,
               color: [0, 0, 0, 0.53],
               z: 3)
    Circle.new(x: 50, y: 50,
               radius: 34,
               sectors: 32,
               color: [0, 0, 0, 0.53],
               z: 3)
  end

  def clear_text
    @player_turn.remove
  end

  ######################
  # container and score display
  def scores(players)
    count = 1
    players.each do |key, val|
      if count == 1
        @player1 = key
        @score1 = val
      else
        @player2 = key
        @score2 = val
      end
      count += 1
    end
    display_scores
  end

  def display_scores
    @p1 = Text.new("#{@player1}  #{@score1}",
                  x: 600, y: 180, z: 8,
                  color: 'black', size: 30)
    @p2 = Text.new("#{@player2}  #{@score2}",
                  x: 600, y: 280, z: 8,
                  color: 'black', size: 30)
  end

  def score_board
    Text.new('Score:', x: 630, y: 100, z: 3,
             color: 'black', size: 30)
    Rectangle.new(width: 240, x: 550,
                  height: 580, y: 10, z: 2,
                  color: 'gray')
    Rectangle.new(width: 250, x: 545,
                  height: 590, y: 5, z: 1,
                  color: [0, 0, 0, 0.53])
  end

  ######################
  def sticker(counter, array)
    x = array[0]
    y = array[1]
    if counter.odd?
      Text.new('Player1', x: x, y: y, z:10,
              size: 20, color: 'black')
    else
      Text.new('Player2', x: x, y: y, z: 10,
              size: 20, color: 'black')
    end
  end










end
