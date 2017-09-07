module Cli

  EXIT_COMMANDS = ['q', 'quit', 'exit']

  def verify_response(response, acceptable_responses)
    if acceptable_responses.include?(response)
      return response
    elsif EXIT_COMMANDS.include?(response)
      exit_game
    else
      while !acceptable_responses.include?(response)
        puts "Sorry, '#{response}' is not a valid answer. Try again."
        response = gets.chomp.downcase
      end
    end
    response
  end

  def exit_game
    puts "Okay Bye."
    exit
  end

end