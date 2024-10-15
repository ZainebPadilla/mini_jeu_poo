require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts '------------------------------------------------'
puts "|Bienvenue sur 'Le jeu du mini-opo' !           |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts '-------------------------------------------------'

puts 'Quel est ton nom?'
print '>'
user_name = gets.chomp
puts "\n "

user = HumanPlayer.new(user_name) # affilier a  la class HumanPlayer
player1 = Player.new('Josiane')
player2 = Player.new('José')

enemy_array = [player1, player2]

puts "Passons à la phase d'attaque :"

# boucle de répétition d'attaque
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)


  puts '  Quelle action veux-tu effectuer ?'
  puts 'a - chercher une meilleure arme'
  puts 's - chercher à se soigner'
  puts '  Attaquer un joueur en vue :'
  puts "0- #{player1.name} a #{player1.gets_life_points} points de vie"
  puts "1- #{player2.name} a #{player2.gets_life_points} points de vie"

  print '>'
  user_choice = gets.chomp

  if user_choice == 'a'
    user.search_weapon
  elsif user_choice == 's'
    user.search_health_pack
  elsif user_choice == '0'
    user.attacks(player1)
  elsif user_choice == '1'
    user.attacks(player2)
  end

  puts "\n "
  puts "Les autres joueurs t'attaquent !"
  enemy_array.each do |enemy|
    enemy.attacks(user)
  end

  puts "\n "
  puts '==> Mise à jour des points :'
  user.show_state
  player1.show_state
  player2.show_state

  break if user.life_points <= 0 || (player1.life_points <= 0 && player2.life_points <= 0)


  puts "________________\n "

  puts "Écris 'ok' pour passer à la suite."
  print '>'
  gets.chomp

  puts '________________'
end

puts "\n "
puts 'La partie est terminée.'

if user.life_points > 0
  puts 'Bravo tu as gagné !!!'

else
  puts 'Loser ! Tu as perdu !'

end

puts "___________________________________\n "
