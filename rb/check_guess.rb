# frozen_string_literal: true

# module CheckGuess
module CheckGuess
  def check_for_matches(code, guess)
    code_copy = code.map(&:clone)
    guess_copy = guess.map(&:clone)
    check_for_matches!(code_copy, guess_copy)
  end

  def check_for_matches!(code, guess)
    exact_matches = check_for_exact_matches(code, guess)
    # when calling unexact matches, all exact matches are already gone, thus we are not counting them
    unexact_matches = check_for_unexact_matches(code, guess)
    [exact_matches, unexact_matches]
  end

  def check_for_exact_matches(code, guess)
    exact_matches = 0
    guess.each_with_index do |number, index|
      next unless code[index] == number

      code[index] = 0
      guess[index] = 0
      exact_matches += 1
    end
    exact_matches
  end

  # This will count unexact AND exact matches!
  def check_for_unexact_matches(code, guess)
    unexact_matches = 0
    guess.each_with_index do |number_guess, index_guess|
      next if number_guess.zero?

      code.each_with_index do |number_code, index_code|
        next unless number_code == number_guess

        code[index_code] = 0
        unexact_matches += 1
      end
    end
    unexact_matches
  end
end
