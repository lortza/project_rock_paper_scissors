require './weapons'

class Player
  include Weapons

end

class HumanPlayer < Player
  def generate_guess
    puts "Please select a weapon by entering #{stringify_weapon_options}:"
    display_weapon_menu
    response = gets.chomp.downcase
  end
end

class ComputerPlayer < Player
  def generate_guess
    weapon_keys.sample
  end
end
