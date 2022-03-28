# frozen_string_literal: true

# module UserInput
module UserInput
  def get_guess
    guess = ask_for_guess()
    transform_guess_into_integer_array(guess)
  end

  def ask_for_guess
    puts "What's your next guess?"
    guess = gets.chomp()
    guess
  end

  def transform_guess_into_integer_array(guess)
    guess_array = guess.split('')
    guess_array.each_index {|index| guess_array[index] = guess_array[index].to_i}
    guess_array
  end
end
