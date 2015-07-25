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

	def generate_board
		format = <<-FORMAT

	A   B   C   D   E   F   G   H   I   J
   +---------------------------------------+
 1 | O | O | O | O | O | O | O | O | O | O |
   |---|---|---|---|---|---|---|---|---|---|
 2 | O | O | O | O | O | O | O | O | O | O |
   |---|---|---|---|---|---|---|---|---|---|
 3 | O | O | O | O | O | O | O | O | O | O |
   |---|---|---|---|---|---|---|---|---|---|
 4 | O | O | O | O | O | O | O | O | O | O |
   |---|---|---|---|---|---|---|---|---|---|
 5 | O | O | O | O | O | O | O | O | O | O |
   |---|---|---|---|---|---|---|---|---|---|
 6 | O | O | O | O | O | O | O | O | O | O |
   |---|---|---|---|---|---|---|---|---|---|
 7 | O | O | O | O | O | O | O | O | O | O |
   |---|---|---|---|---|---|---|---|---|---|
 8 | O | O | O | O | O | O | O | O | O | O |
   |---|---|---|---|---|---|---|---|---|---|
 9 | O | O | O | O | O | O | O | O | O | O |
   |---|---|---|---|---|---|---|---|---|---|
10 | O | O | O | O | O | O | O | O | O | O |
   +---------------------------------------+
					FORMAT

		board_string.chars.each do |cell|
			format = format.sub("O", cell)
		end
		puts
		puts "#{name}'s board  #{format}"
	end

end