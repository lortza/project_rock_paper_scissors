module CLI

  EXIT_COMMANDS = ['q', 'quit', 'exit']

  def ensure_valid_response(acceptable_responses)
    response = get_response

    if acceptable_responses.include?(response)
      return response
    elsif EXIT_COMMANDS.include?(response)
      exit_game
    else
      puts "Sorry, '#{response}' is not a valid answer. Try again."
      ensure_valid_response(acceptable_responses)
    end
  end

  def get_response
    gets.chomp.downcase
  end

  def stringify_response_options(options_lib)
    output = options_lib.keys[0..-2].join(", ") + ", or #{options_lib.keys[-1]}"
  end

  def response_options(options_lib)
    options_lib.keys
  end

  def display_options_menu(options_lib)
    options_lib.each do |k, v|
      puts "#{k}: #{v}"
    end
  end

  def exit_game
    puts "Okay Bye."
    exit
  end

end