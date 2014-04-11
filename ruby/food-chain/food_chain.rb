require 'pry'

class FoodChainSong
  attr_reader :verse_number, :animal

  def verse(number)
    @verse_number = number
    @animal = Animal.for(verse_number)
    assemble_parts
  end

  def assemble_parts
    intro + exclamation + reason + close
  end

  def intro
    "I know an old lady who swallowed a #{animal}.\n"
  end

  def exclamation
    {
      1 => "",
      2 => "It wriggled and jiggled and tickled inside her.\n",
      3 => "How absurd to swallow a #{animal}!\n",
      4 => "Imagine that, to swallow a #{animal}!\n",
      5 => "What a hog, to swallow a #{animal}!\n",
      6 => "Just opened her throat and swallowed a #{animal}!\n",
      7 => "I don't know how she swallowed a #{animal}!\n",
      8 => ""
    }[verse_number]
  end

  def reason
    {
      1 => "",
      2 => "",
      3 => "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n",
      4 => "She swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n",
      5 => "She swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n",
      6 => "She swallowed the goat to catch the dog.\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n",
      7 => "She swallowed the cow to catch the goat.\nShe swallowed the goat to catch the dog.\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n",
      8 => ""
    }[verse_number]
  end

  def close
    close = ""
    close << "She swallowed the spider to catch the fly.\n" if verse_number > 1 && verse_number < 8
    close << "I don't know why she swallowed the fly. Perhaps she'll die." if verse_number < 8
    close << "She's dead, of course!" if verse_number == 8
    close + "\n"
  end
end

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
