class Ships

	attr_reader :fleet

	def initialize
		@fleet = []
		generate_ships
	end

	def generate_ships
		3.times do
			starting_index = rand(0...99)
			@fleet << [starting_index, starting_index+1, starting_index+2]
			fleet
		end
	end
end

class Board
	attr_reader :board_string, :name

	def initialize(name)
		@board_string = " "*100
		@name = name
	end

	def fire(player, board_string, cell_index)
		if board_string[cell_index] == "H" || board_string[cell_index] == "M"
			puts "#{player.name}, try again."
			play(player, board_string)
		elsif hit_ship?(player, cell_index)
			puts "Yay, #{player.name} shot a ship!"
			board_string[cell_index] = "H"
		else
			puts "Boo. #{player.name} missed!"
			board_string[cell_index] = "M"
		end
	end

	def play (player, board_string)
		cell_index = obtain_index(player)
		fire(player, board_string, cell_index)
		player.generate_board
	end

	def obtain_index(player)
		if player == enemy
			rand(0..100)
		else
			obtain_player_input
		end
	end

	def sunk_ship?(ship)
		puts "Sunk ship!" if ship == [0, 0, 0]
	end

	def hit_ship?(player, cell_index)
		if player == @enemy
			opponent_ships = home_s.fleet
		else
			opponent_ships = enemy_s.fleet
		end

		(0...3).each do |ship|
			valid_target = opponent_ships[ship].index(cell_index)

			if valid_target
				p opponent_ships[ship][valid_target]
				opponent_ships[ship][valid_target] = 0
				sunk_ship?(opponent_ships[ship])
				return true
			end
		end
		false
	end

	def lose?
		home_s.fleet == Array.new(3){[0,0,0]}
	end
end