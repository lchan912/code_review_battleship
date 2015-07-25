class View
  def notify_results(win)
    if win
      puts "YOU WON!!!"
    else
      puts "YOU LOSE!!"
    end
  end

  def generate_board(board_string)
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

  def obtain_player_input
    puts "Enter missile coordinates: "
    gets.chomp.to_i
  end
end