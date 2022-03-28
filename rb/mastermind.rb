# frozen_string_literal: true

require_relative 'check_guess'
require_relative 'user_input'
require_relative 'ai'
require_relative 'random_code'

# class MastermindCodeGuesser
class MastermindCodeGuesser
  include CheckGuess
  include UserInput
  include RandomCode

  # code should be a 4-length array with numbers between 1 and 6
  def initialize(max_turns)
    @code = create_random_code
    @turn = 0
    @game_running = true
    @max_turns = max_turns
  end

  def play
    one_turn while game_running
    puts 'Game over! The secret code was:'
    p code
  end
  
  private

  attr_accessor :turn, :game_running
  attr_reader :code, :max_turns

  def update_game_running
    return unless turn >= max_turns

    self.game_running = false
  end

  def one_turn
    self.turn += 1
    guess = get_guess
    matches = check_for_matches(code, guess)
    p "There are #{matches[0]} digits correct AND at the right place and #{matches[1]} digits are correct BUT at the wrong place."
    update_game_running
    return unless matches[0] == 4

    puts "Congratulations, you've won in #{self.turn} turns!"
    self.game_running = false
  end
end

# MastermindCodeCreator class
class MastermindCodeCreator
  include CheckGuess
  include UserInput

  attr_reader :ai, :code
  attr_accessor :game_running, :turn

  def initialize()
    @turn = 0
    @ai = ArtificialIntelligence.new()
    @game_running = true
  end

  def make_a_guess()
    self.turn += 1
    p "Guessing #{ai.guess}..."
    aim = check_for_matches(code, ai.guess)
    sleep(1)
    p "There are #{aim[0]} digits correct AND at the right place and #{aim[1]} digits are correct BUT at the wrong place."
    sleep(1)
    if aim == [4,0]
      puts "The correct code was found in #{turn} turns!"
      self.game_running = false
      return
    end
    ai.update_solutions(aim)
    ai.update_guess()
    puts ''
  end

  def play()
    puts 'Please enter a secret four digit code consisting of digits between 1 and 6.'
    secret_code = get_guess('What\'s the secret code?')
    @code = secret_code
    puts ''
    make_a_guess while game_running
  end
end
