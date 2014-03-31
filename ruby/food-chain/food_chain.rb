require 'pry'

class FoodChainSong

  def verse(number)
    intro(number) + verses[number] + close(number)
  end

  def verses
    {
      1 => "",
      2 => "It wriggled and jiggled and tickled inside her.\n",
      3 => "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
    }
  end

  def intro(verse)
    animal = verse_animal[verse]
    verse > 2 ? intro_line_2 = exclamation(verse, animal) : intro_line_2 = ""
    "I know an old lady who swallowed a " + animal + ".\n" + intro_line_2
  end

  def exclamation(verse, animal)
    {
      3 => "How absurd to swallow a "
    }[verse] + animal + "!\n"
  end

  def verse_animal
    {
      1 => "fly",
      2 => "spider",
      3 => "bird",
      4 => "cat",
    }
  end

  def close(verse)
    close = ""
    close << "She swallowed the spider to catch the fly.\n" if verse > 1
    close << "I don't know why she swallowed the fly. Perhaps she'll die.\n"
  end

end


# Intro (verse dependant animal)
# "I know an old lady who swallowed a cow.\n" +

# Exclamation (verse 3+)
# "I don't know how she swallowed a cow!\n" +

# Reason (verse 2)
# "It wriggled and jiggled and tickled inside her.\n"

# Reasons (verse 3+)
# "She swallowed the cow to catch the goat.\n" +
# "She swallowed the goat to catch the dog.\n" +
# "She swallowed the dog to catch the cat.\n" +
# "She swallowed the cat to catch the bird.\n" +
# "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"

# Close
# "She swallowed the spider to catch the fly.\n" + (verse 2+)
# "I don't know why she swallowed the fly. Perhaps she'll die.\n" (all)
