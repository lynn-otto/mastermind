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

  # code should be a 4-length array with numbers between 1 and 6
  def initialize(code)
    @code = code
    @turn = 0
  end
end

test_guesser = MastermindCodeGuesser.new([1, 2, 3, 4])
p test_guesser.check_for_matches([1, 2, 4, 4], [4, 4, 6, 4])
guess = test_guesser.get_guess()
p guess
