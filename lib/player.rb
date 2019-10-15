class Player

attr_accessor :name , :life_points 


  def initialize(put_name)
  	@name = put_name.to_s 
  	@life_points = 10
  end

  def show_state
    if @life_points < 0 then @life_points = 0
    end 
  	print "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(i)
  	if @life_points - i.to_i > 0
       return @life_points = (@life_points - i.to_i)
    elsif @life_points - i.to_i == 0
    	return  "Le joueur José a été tué !"  	
    end
  end 

  def compute_damage
    return damage = rand(1..6)
  end
 
  def attacks(player2) 
	puts "#{@name} attaque #{player2.name} "
	damage = compute_damage
  	puts "Il lui inflige #{damage} points de dommages !"
    if player2.life_points - damage <= 0
      puts "#{player2.name} a été tué !"
    end 
  	return player2.life_points = player2.life_points - damage 
  end

end




class HumanPlayer < Player 
  attr_accessor :weapon_level

  def initialize(put_name)
    super(put_name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    super 
    puts " et une arme de niveau #{@weapon_level}"
  end


  def compute_damage
    super * @weapon_level
  end
    
  def search_weapon
    puts "lance un dé en appuyant sur la touche entrée" 
    gets.chomp
    de = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{de}"
      if de > @weapon_level then @weapon_level = de 
        puts "Youhou ! Elle est meilleure qui ton arme actuelle : you take it baby !"
      else puts "Puting de merde! Elle n'est pas mieux... Ne la prends pas !"
      end 
  end 


  def search_health_pack
    puts "lance un dé en appuyant sur la touche entrée" 
    gets.chomp
    de2 = rand(1..6)
      if de2 == 1 
        puts "Tu as lancé #{de2}. Malhreusement mon brave, tu n'as rien trouvé..."
      elsif ( de2 <= 2 && de2 >=5 ) 
        @life_points = @life_points + 50
        puts "Youhou, dingo ! Tu as lancé #{de2}. Tu as trouvé un pack de +50 points de vie!"
      else @life_points = @life_points + 80
        puts "Waouuuuuw, Tu as lancé #{de2}. Tu as trouvé un pack de +80 points de vie!"
      end 

      if @life_points > 100
       @life_points = 100 
      else@life_points
      end 

  end 

end  

