class Round

  def determine_round_winner(player1_weapon, player2_weapon)
    if player1_weapon == player2_weapon
      @round_winner = 'tie'
    elsif player1_weapon == "r" && player2_weapon == "p"
      @round_winner = 'player2'
    elsif player1_weapon == "p" && player2_weapon == "s"
      @round_winner = 'player2'
    elsif player1_weapon == "s" && player2_weapon == "r"
        @round_winner = 'player2'
    else
      @round_winner = 'player1'
    end
  end

end