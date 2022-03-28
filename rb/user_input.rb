# frozen_string_literal: true

# module UserInput
module UserInput
  private
  def get_guess(ask_line = 'What\'s your next guess?' )
    correct_guess = false
    guess_array = []
    until correct_guess
      guess = ask_for_guess(ask_line)
      correct_guess = four_digit_code?(guess)
      guess_array = transform_guess_into_integer_array(guess)
      correct_guess = code_in_range?(guess_array)
    end
    guess_array
  end

  def four_digit_code?(guess)
    return true unless guess.to_i.zero? || guess.length != 4

    puts 'Please enter a four digit code.'
    false
  end

  def code_in_range?(guess_array)
    guess_array.each do |digit|
      next if digit.between?(1, 6)

      puts 'Please enter a code with digits between 1 and 6.'
      return false
    end
    true
  end

  def ask_for_guess(ask_line)
    puts ask_line
    guess = gets.chomp()
    guess
  end

  def transform_guess_into_integer_array(guess)
    guess_array = guess.split('')
    guess_array.each_index {|index| guess_array[index] = guess_array[index].to_i}
    guess_array
  end
end
