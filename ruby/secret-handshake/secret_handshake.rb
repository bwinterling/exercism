require 'pry'

class SecretHandshake
  attr_reader :binary

  def initialize(input)
    @binary = clean_input(input)
  end

  def clean_input(input)
    if input.kind_of? Integer
      input.to_s(2).chars.reverse
    else
      []
    end
  end

  def output
    {
      0 => "wink",
      1 => "double blink",
      2 => "close your eyes",
      3 => "jump"
    }
  end

  def commands
    reverse? ? reverse_code : code
  end

  def reverse?
    binary.length == 5
  end

  def code
    binary.length.times.map { |i|
      output[i] if binary[i] == "1"
    }.compact
  end

  def reverse_code
    code.reverse
  end

end
