	require_relative 'model.rb'
	require_relative 'view.rb'

	class Battleship

		attr_reader :enemy, :home, :board_string_e, :board_string_h, :enemy_s, :home_s

		def launch
			@enemy = Board.new('Enemy')
			@home = Board.new('Home')
			@board_string_e = @enemy.board_string
			@board_string_h = @home.board_string
			@enemy_s = Ships.new
			@home_s = Ships.new
			turn_taking
		end

		def turn_taking
			until game_over?
				play(home, board_string_e)
				puts "Opponent's turn..."
				sleep(2)
				play(enemy, board_string_h)
			end

			puts "YOU WON!!!" if win?
			puts "YOU LOSE!!" if lose?
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

		def obtain_player_input
			puts "Enter missile coordinates: "
			gets.chomp.to_i
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

		def game_over?
			p "Enemy's fleet: #{enemy_s.fleet}"
			p "Home's fleet: #{home_s.fleet}"
			return true if win?
			return true if lose?
		end

		def win?
			enemy_s.fleet == Array.new(3){[0,0,0]}
		end

		def lose?
			home_s.fleet == Array.new(3){[0,0,0]}
		end

	end
