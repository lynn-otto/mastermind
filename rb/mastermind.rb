# frozen_string_literal: true

# setup
# class MastermindCodeGuesser
# check for codes and give feedback
# class MastermindCodeCreator
require_relative '../rb/check_guess'
require_relative '../rb/user_input'


# class MastermindCodeGuesser
class MastermindCodeGuesser
  include CheckGuess
  include UserInput

  attr_reader :code
  attr_accessor :turn, :game_running

  # code should be a 4-length array with numbers between 1 and 6
  def initialize(code)
    @code = code
    @turn = 0
    @game_running = true
  end

  def update_game_running
    return unless turn >= 5

    self.game_running = false
  end

  def one_turn
    self.turn += 1
    guess = get_guess
    matches = check_for_matches(code, guess)
    p matches
    update_game_running
    return unless matches[0] == 4
    
    puts "Congratulations, you've won in #{self.turn} turns!"
    self.game_running = false
  end

  def play
    one_turn while game_running
    puts 'Game over!'
  end
end

test_guesser = MastermindCodeGuesser.new([1, 2, 3, 4])
#p test_guesser.check_for_matches([1, 2, 4, 4], [4, 4, 6, 4])
#guess = test_guesser.get_guess()
#p guess
test_guesser.play
