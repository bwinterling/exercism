require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'proverb'

class ProverbTest < MiniTest::Test
  def test_a_single_consequence
    proverb = Proverb.new('nail', 'shoe')
    expected = "For want of a nail the shoe was lost.\n" +
      "And all for the want of a nail."
    assert_equal expected, proverb.to_s
  end

  def test_a_short_chain_of_consequences
    proverb = Proverb.new('nail', 'shoe', 'horse')
    expected = "For want of a nail the shoe was lost.\n" +
      "For want of a shoe the horse was lost.\n" +
      "And all for the want of a nail."
    assert_equal expected, proverb.to_s
  end

  def test_a_longer_chain_of_consequences
    proverb = Proverb.new('nail', 'shoe', 'horse', 'rider')
    expected = "For want of a nail the shoe was lost.\n" +
      "For want of a shoe the horse was lost.\n" +
      "For want of a horse the rider was lost.\n" +
      "And all for the want of a nail."
    assert_equal expected, proverb.to_s
  end

  def test_the_whole_proverb
    chain = [
      'nail', 'shoe', 'horse', 'rider', 'message', 'battle', 'kingdom'
    ]
    proverb = Proverb.new(*chain)
    expected = "For want of a nail the shoe was lost.\n" +
      "For want of a shoe the horse was lost.\n" +
      "For want of a horse the rider was lost.\n" +
      "For want of a rider the message was lost.\n" +
      "For want of a message the battle was lost.\n" +
      "For want of a battle the kingdom was lost.\n" +
      "And all for the want of a nail."
    assert_equal expected, proverb.to_s
  end

  def test_an_optional_qualifier_in_the_final_consequence
    chain = [
      'nail', 'shoe', 'horse', 'rider', 'message', 'battle', 'kingdom'
    ]
    proverb = Proverb.new(*chain, qualifier: 'horseshoe')
    expected = "For want of a nail the shoe was lost.\n" +
      "For want of a shoe the horse was lost.\n" +
      "For want of a horse the rider was lost.\n" +
      "For want of a rider the message was lost.\n" +
      "For want of a message the battle was lost.\n" +
      "For want of a battle the kingdom was lost.\n" +
      "And all for the want of a horseshoe nail."
    assert_equal expected, proverb.to_s
  end

end
