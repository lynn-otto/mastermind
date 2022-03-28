# frozen_string_literal: true
require_relative 'check_guess'


class ArtificialIntelligence
  include CheckGuess

  attr_accessor :solutions, :guesses, :guess

  def initialize()
    @solutions = create_all_solutions
    @guess = [1, 1, 2, 2]
    @guesses = []
  end

  def update_guess()
    next_guess = guess
    self.guesses.append(guess)
    guesses
    index = 0
    while guesses.include?(next_guess)
      next_guess = solutions[index]
      index += 1
    end
    self.guess = next_guess
  end

  def update_solutions(aim)
    solutions_copy = solutions.map(&:clone)
    solutions.each do |solution|
      hint = check_for_matches(solution, guess)
      next if hint == aim
      
      solutions_copy.delete(solution)
    end
    self.solutions = solutions_copy
  end
  private
  def create_all_solutions()
    solutions = []
    6.times do |i|
      6.times do |j|
        6.times do |k|
          6.times do |l|
            next_solution = [i+1, j+1, k+1, l+1]
            solutions.append(next_solution)
          end
        end
      end
    end
    solutions
  end
end
