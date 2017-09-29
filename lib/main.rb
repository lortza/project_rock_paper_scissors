require_relative 'ascii_art'
require_relative 'cli'
require_relative 'game'

class Rps
  include Cli

  attr_accessor :play_game

  def initialize
    @play_game = true
  end

  def welcome_player
    puts AsciiArt::TITLE
    puts "You go head to head against the computer's randomly-selected weapon."
    puts "The winner is the player who won the best out of 3 rounds."
    puts "Enter 'q' to quit at any time."
  end

  def request_player_count
    puts "How many players? 1 or 2?"
    response = gets.chomp
    verify_response(response, ['1', '2'])
  end

  def determine_type_of_game(player_count)
    if player_count == "1"
      return 'one_player'
    else player_count == "2"
      return 'two_player'
    end
  end

  def play_again?
    puts "Play again? Y | N"
    player_response = gets.chomp.upcase
    if player_response == "Y"
      return true
    elsif player_response == "N"
      exit_game
    else
      puts "I'm sorry, that's not an option."
      play_again?
    end
  end
end

rps = Rps.new
while rps.play_game
  rps.welcome_player
  game_type = rps.determine_type_of_game(rps.request_player_count)
  if game_type == 'one_player'
    game = Game.new
    game.play_one_player
  else
    game = Game.new
    game.play_two_player
  end

  rps.play_game = rps.play_again?
end
