module RandomCode
  private
  def random_number_between_one_and_six()
    number = 1 + rand(6)
    number
  end

  def create_random_code()
    code = []
    4.times do |_i|
      code.append(random_number_between_one_and_six)
    end
    code
  end
end
