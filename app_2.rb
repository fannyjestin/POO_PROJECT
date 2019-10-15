require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


system "clear"

puts "
		------------------------------------------------
		|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
		|Le but du jeu est d'être le dernier survivant !|
		-------------------------------------------------

                          oooo$$$$$$$$$$$$oooo
                      oo$$$$$$$$$$$$$$$$$$$$$$$$o
                   oo$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o         o$   $$ o$
   o $ oo        o$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o       $$ $$ $$o$
oo $ $ $$      o$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$o       $$$o$$o$
$$$$$$$o$     o$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$o    $$$$$$$$
  $$$$$$$    $$$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$$$$$$$$$$$$$$
  $$$$$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$$$$$$  $$$$$$
   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     $$$$
    $$$   o$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     $$$$o
   o$$$   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$       $$$o
   $$$    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$ooooo$$$$o
  o$$$oooo$$$$$  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   o$$$$$$$$$$$$$$$$$
  $$$$$$$$$$$$$   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     $$$$$$$$$$$$
 $$$$       $$$$    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$      o$$$
            $$$$o     $$$$$$$$$$$$$$$$$$$$$$$$$         $$$
              $$$o          $$$$$$$$$$$$$$$           o$$$
               $$$$o                 oo             o$$$$
                $$$$$o      o$$$$$$o$$$$$o        o$$$$
                  $$$$$$oo     $$$$$$o$$$$$o   o$$$$$$  
                     $$$$$$$oooo  $$$$o$$$$$$$$$$$$
                        $$$$$$$$$oo $$$$$$$$$$       
                                $$$$$$$$$$$$$$$        
                                    $$$$$$$$$$$$       
                                     $$$$$$$$$$$      
                                      $$$$$$$$
					                            



____________QUI SERA A LA HAUTEUR ? JOSE vs JOSIANE vs OAM_________

"

puts "Quel est ton petit nom ?"
@name = gets.chomp.to_s
user = HumanPlayer.new(@name) 

#creation of enmies array
enemies = []
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies << player1
enemies << player2


	while  (user.life_points > 0) && ( player1.life_points > 0 || player2.life_points >0 )  
    
    user.show_state
	puts "" 
	    puts "Quelle action veux-tu effectuer?"
	    puts "tape - a - pour chercher une meilleure arme"
	    puts "tape - s - pour chercher à te soigner"
	    puts ""
	    puts "Pour attaquer un joueur en vue :"
	    print "Tape - 0 - pour combattre Josiane. "
	    puts "#{player1.show_state}" 
	    print "Tape - 1 - pour combattre José. "
	    puts "#{player2.show_state}" 
	    user_input = gets.chomp.to_s 

	    system "clear"


	    case user_input 
	    	when "a"
	    		user.search_weapon
	    	when "s"
	    		user.search_health_pack
	    	when "0"
	    		user.attacks(player1)
	    	when "1"
	    		user.attacks(player2)
	    end

	    puts ""


	    puts "Les autres joueurs t'attaquent !" if player1.life_points > 0 || player2.life_points > 0
	    enemies.each{|player|
	    	         player.attacks(user) if player.life_points > 0
	                 } 
	    puts ""
	    end 


(user.life_points > 0)? (puts "BRAVO TU AS GAGNEEEEE ! ❀ ヅ ❤ ♫ !") : (puts "LOOSEEER ! T'as perdu contre les deux Jojo ! (⌣̩̩́_⌣̩̩̀) (ʃ_⌣̀ )")









