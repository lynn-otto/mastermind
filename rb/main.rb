# frozen_string_literal: true

require_relative 'mastermind'

puts 'Let\'s play a round of mastermind.'
puts 'Do you want to create a code (CREATE) or guess (GUESS)?'
game_mode = gets.chomp
puts ''
if game_mode == 'CREATE'
  puts 'You will create a code and the computer will try to solve it.'
  puts ''
  coder = MastermindCodeCreator.new
  coder.play
else
  puts 'You will guess a code the computer picked randomly.'
  puts ''
  guesser = MastermindCodeGuesser.new(6)
  guesser.play
end
