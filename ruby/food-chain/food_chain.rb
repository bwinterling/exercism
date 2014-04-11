require 'pry'

class FoodChainSong
  attr_reader :verse_number, :animal

  def verse(number)
    @verse_number = number
    @animal = Animal.for(verse_number)
    assemble_parts
  end

  def assemble_parts
    intro + verses[verse_number] + close
  end

  def intro
    verse_number > 2 ? intro_2 = exclamation : intro_2 = ""
    "I know an old lady who swallowed a " + animal + ".\n" + intro_2
  end

  def exclamation
    {
      3 => "How absurd to swallow a "
    }[verse_number] + animal + "!\n"
  end

  def verses
    {
      1 => "",
      2 => "It wriggled and jiggled and tickled inside her.\n",
      3 => "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
    }
  end

  def close
    close = ""
    close << "She swallowed the spider to catch the fly.\n" if verse_number > 1
    close << "I don't know why she swallowed the fly. Perhaps she'll die.\n"
  end

end


# Intro (verse dependant animal) (1-8)
# "I know an old lady who swallowed a cow.\n" +

# Exclamation (verse 3-7)
# "I don't know how she swallowed a cow!\n" +

# Reason (verse 2)
# "It wriggled and jiggled and tickled inside her.\n"

# Reasons (verse 3-7)
# "She swallowed the cow to catch the goat.\n" +
# "She swallowed the goat to catch the dog.\n" +
# "She swallowed the dog to catch the cat.\n" +
# "She swallowed the cat to catch the bird.\n" +
# "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"

# Close (1-7)
# "She swallowed the spider to catch the fly.\n" + (verse 2+)
# "I don't know why she swallowed the fly. Perhaps she'll die.\n" (1-7)
# "She's dead, of course!\n" (8)

class Animal
  def self.for(verse)
    {
      1 => "fly",
      2 => "spider",
      3 => "bird",
      4 => "cat",
      5 => "dog",
      6 => "goat",
      7 => "cow",
      8 => "horse"
    }[verse]
  end
end
