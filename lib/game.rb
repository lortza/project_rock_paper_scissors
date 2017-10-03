require_relative 'cli'
require_relative 'weapons'
require_relative 'winner'

class Game
  include CLI
  include Weapons
  include WinnerFactory

  attr_accessor :player1_score, :player2_score, :round_winner, :game_winner, :round_number

  def initialize
    @player1_score = 0
    @player2_score = 0
    @round_number = 1
    @round_winner = ''
    @game_winner = ''
  end

  private

  def announce_round
    puts '','-' * 15
    puts "Round #{@round_number}!"
    puts '-' * 15
    @round_number += 1
  end

  def request_player_choice
    puts "Please select a weapon by entering #{stringify_response_options(WEAPONS_LIB)}:"
    display_options_menu(WEAPONS_LIB)
    ensure_valid_response(WEAPONS_LIB)
  end

  def determine_winner(player1_arg, player2_arg, session_type)
    if session_type == 'round'
      @round_winner = RoundWinner.new(WEAPONS_SCORE).call(player1_arg, player2_arg)
    else
      @game_winner = GameWinner.new.call(player1_arg,player2_arg)
    end
  end

  def award_points
    if @round_winner == 'tie'
    elsif @round_winner == 'player1'
      @player1_score += 1
    else
      @player2_score += 1
    end
  end

  def display_score(player2_name)
    puts "Current scores: Player 1: #{@player1_score} | #{player2_name}: #{@player2_score}"
  end

  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end

  def play(player2_name, weapon_selection_proc)
    clear_screen
    puts "You are playing against #{player2_name}."
    3.times do
      announce_round
      puts "Player 1's Turn:"
      player1_choice = request_player_choice
      puts "","#{player2_name}'s Turn:"
      player2_choice = weapon_selection_proc.call
      puts "#{player2_name} chose: #{player2_choice}"
      determine_winner(player1_choice, player2_choice, 'round')
      award_points
      WinnerFactory.announce_winner(player2_name, @round_winner, 'round')
      display_score(player2_name)
    end
    determine_winner(@player1_score, @player2_score, 'game')
    WinnerFactory.announce_winner(player2_name, @game_winner, 'game')
    display_score(player2_name)
  end

end

class OnePlayer < Game
  def play_game
    play("The Computer", Proc.new { computer_makes_choice(response_options(WEAPONS_LIB)) })
  end

  def computer_makes_choice(weapons)
    weapons.sample
  end
end

class TwoPlayer < Game
  def play_game
    play("Player 2", Proc.new { request_player_choice })
  end
end

