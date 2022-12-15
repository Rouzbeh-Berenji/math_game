class Questions
  attr_reader :correct_answer

  def initialize
    @num1 = rand(20)
    @num2 = rand(20)
    @correct_answer = @num1 + @num2

  end

  def display_question
    "what is #{@num1} + #{@num2}"
  end

  def correct?(guess)
    guess == @correct_answer
  end

end
