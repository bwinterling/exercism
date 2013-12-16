require_relative 'proverb'

chain = ['nail', 'shoe', 'horse', 'rider', 'message', 'battle', 'kingdom']
proverb = Proverb.new(*chain, qualifier: 'horseshoe')
3.times { puts proverb.to_s }
