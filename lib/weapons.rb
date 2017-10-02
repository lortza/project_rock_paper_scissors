module Weapons

  WEAPONS_LIB = {
    "r" => "Rock",
    "p" => "Paper",
    "s" => "Scissors"
  }

  WEAPONS_SCORE = {
    ['r', 'p'] => 'player2',
    ['p', 's'] => 'player2',
    ['s', 'r'] => 'player2'
  }

end