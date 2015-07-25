require_relative 'model.rb'
require_relative 'view.rb'

class Battleship

	def initialize
		@view = View.new
	end

	def launch
		@enemy = Board.new('Enemy')
		@home = Board.new('Home')
		@enemy_s = Ships.new
		@home_s = Ships.new
		turn_taking
	end

	def turn_taking
		until game_over?
			@home.play
			puts "Opponent's turn..."
			sleep(2)
			@enemy.play
		end

		@view.notify_results(@enemy.lose?)
	end

	private
	def game_over?
		p "Enemy's fleet: #{enemy_s.fleet}"		
		p "Home's fleet: #{home_s.fleet}"
		return true if @enemy.lose? || @home.lose?
	end
end