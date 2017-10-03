require_relative 'weapons'

module WinnerFactory
  include Weapons


  def self.announce_winner(player2_name, winner, session_type)
    if winner == 'tie'
      puts "This #{session_type} was a tie."
    elsif winner == 'player1'
      puts "Player 1 wins the #{session_type}."
    else
      puts "#{player2_name} wins the #{session_type}."
    end
  end

end

class RoundWinner
  def initialize(weapons = {})
    @weapons = weapons
  end

  def call(player1_weapon, player2_weapon)
    return 'tie' if player1_weapon == player2_weapon
    @weapons[ [player1_weapon, player2_weapon] ] || 'player1'
  end
end

class GameWinner
  def call(player1_score, player2_score)
    if player1_score == player2_score
      'tie'
    elsif player1_score > player2_score
      'player1'
    else
      'player2'
    end
  end
end