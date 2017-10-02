class RoundWinner
  def initialize(weapons = {})
    @weapons = weapons
  end

  def call(player1_weapon, player2_weapon)
    return 'tie' if player1_weapon == player2_weapon
    @weapons[ [player1_weapon, player2_weapon] ] || 'player1'
  end
end