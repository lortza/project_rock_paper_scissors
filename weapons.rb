module Weapons
  WEAPONS = {
    "r" => "Rock",
    "p" => "Paper",
    "s" => "Scissors"
  }

  def stringify_weapon_options
    output = WEAPONS.keys[0..-2].join(", ") + ", or #{WEAPONS.keys[-1]}"
  end

  def weapon_keys
    WEAPONS.keys
  end

  def display_weapon_menu
    WEAPONS.each do |k, v|
      puts "#{k}: #{v}"
    end
  end

end

