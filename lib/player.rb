class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points"
    return unless @life_points <= 0

    puts "#{@name} a été tué"
  end

  def attacks(player)
    # self fait référence à l'instance de Player qui appelle la méthode. Si on écrit player1.attacks(player2), alors self est player1.
    puts "#{name} attaque #{player.name}"
    damage = compute_damage
    puts "#{name} lui inflige #{damage} points de dégât"
    player.gets_damage(damage) # Appelle la méthode pour réduire les points de vie de l'adversaire
  end

  def compute_damage
    rand(1..6)
  end

  def gets_damage(points)
    @life_points -= points
    @life_points
  end

  def show_state
    puts "#{@name} a #{@life_points} points"
    return unless @life_points <= 0

    puts "#{@name} a été tué"
  end

  def gets_life_points
    @life_points
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points et une arme de niveau #{@weapon_level}"
    return unless @life_points <= 0

    puts "#{@name} a été tué"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_level}"
    if new_level > @weapon_level
      @weapon_level = new_level
      puts "Bravo tu as maintenant une arme de #{new_level}"
    else
      puts 'Dommage tu as déjà une arme plus puissante'
    end
  end

  def search_health_pack
    lance_de = rand(1..6)
    if lance_de == 1
      puts "Tu n'as rien trouvé..."
    elsif lance_de >= 2 && lance_de <= 5
      @life_points += 50
      puts 'Bravo, tu as trouvé un pack de +50 points de vie !'
    elsif lance_de == 6
      @life_points += 80
      puts 'Waow, tu as trouvé un pack de +80 points de vie !'
    end
  end
end
