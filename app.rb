require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('Josiane')
player2 = Player.new('José')

puts "Voici l'état de chaque joueur :"
puts player1.show_state
puts player2.show_state

puts "\n "

puts "Passons à la phase d'attaque :"

# boucle de répétition d'attaque
while player1.life_points > 0 && player2.life_points > 0
  player1.attacks(player2)
  puts "Voici l'état de chaque joueur :"
  puts player1.show_state
  puts player2.show_state

  break if player2.life_points <= 0 || player2.life_points <= 0

  player2.attacks(player1)
  puts "Voici l'état de chaque joueur :"
  puts player1.show_state
  puts player2.show_state

  puts "\n "

end

puts 'La partie est terminée.'

if player1.life_points > 0
  puts "#{player1.name} a gagné"

else
  puts "#{player2.name} a gagné"

end

puts "___________________________________\n "

binding.pry
