

class  Player

  attr_accessor :name,  :life_points
 
  def initialize (name)

    @name = name
    @life_points = 10

  end


  def gets_damage(point)
        @life_points -=  point
    return @life_points
  end

  def show_state
   
    puts "#{@name} a #{@life_points} points"
    if @life_points <= 0 
      puts "#{@name} a été tué"
    end

  end


  def attacks(player)
    #self fait référence à l'instance de Player qui appelle la méthode. Si on écrit player1.attacks(player2), alors self est player1.
    puts "#{self.name} attaque #{player.name}"
    damage = compute_damage 
    puts "#{self.name} lui inflige #{damage} points de vie"
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end


  def show_state
   
    puts "#{@name} a #{@life_points} points"
    if @life_points <= 0 
      puts "#{@name} a été tué"
    end

  end
 
end

