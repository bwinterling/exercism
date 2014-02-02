class WordProblem
  attr_reader :equation, :question, :numbers

  def initialize(question)
    @question = question
    @numbers = remove_non_numbers
    @operators = collect_operators
  end

  def answer
    total = 0
    numbers.each_with_index { |n, i|
      total += (n.to_i.send(@operators[i], @numbers[i+1].to_i)) unless @numbers[i+1].nil?
    }
    total
  end

private
  def remove_non_numbers
    question.gsub(/[a-zA-Z]/, "").gsub("?", "").split(" ")
  end

  def collect_operators
    question.scan(/plus|minus|multiplied|divided/).map do |o|
      conversions[o]
    end
  end

  def conversions
    {
      "plus"  => "+",
      "minus" => "-",
      "multiplied" => "*",
      "divided" => "/"
    }
  end

end
