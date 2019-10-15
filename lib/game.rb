
class Game 
attr_accessor :human_player
attr_accessor :enemies


	def initialize(name)

		@human_player = HumanPlayer.new(@name)
		player1 = Player.new("Josiane")
		player2 = Player.new("José")
		player3 = Player.new("Jacasse")
		player4 = Player.new("jacob")
		@enemies = [player1, player2, player3, player4]
	end 


	def kill_player
	  @enemies.delete_at(rand(@enemies))
	  return @enemies
    end

    def is_still_ongoing?
	  return false if @human_player.life_points <= 0
	  return false if ( ( @enemies.each{ |enemy| enemy.life_points > 0}.size == 0))
	  return true
	end 

	def show_players
	puts "#{@human_player.name} a #{@human_player.life_points} points de vie et #{@human_player.weapon_level} de niveau d'arme"
	puts "Il reste #{@enemies.size} enemies "	
	end
end 


my_game = Game.new("Wolverine")