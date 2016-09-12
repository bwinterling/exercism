require 'pry'

class Fixnum
  def to_roman

    if self < 4
      return (1..self).inject("") { |mem, n| mem + 'I' }
    elsif self == 4
      return "IV"
    else
      "V"
    end

  end
end
