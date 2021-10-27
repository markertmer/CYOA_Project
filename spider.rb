#INTRO

class GameMaster

  def initialize(choice)
    $game_stats = {}
      @objective = choice
      $game_stats[:objective] = "#{@objective}"
    # puts game_stats.keys
    # puts game_stats.values
    # puts game_stats
  end

  def name_num(name)
    @name = name
    $game_stats[:name] = "#{@name}"
    if @name.size <= 5
      $game_stats[:over5] = false
    else
      $game_stats[:over5] = true
    end
    if @name.size % 3 == 0
      $game_stats[:threemainder] = 0
    elsif @name.size % 3 == 1
      $game_stats[:threemainder] = 1
    else
      $game_stats[:threemainder] = 2
    end
    #puts $game_stats
  end
end
#   def spider
#
#
#
# end

puts "HOLY CRAP! There's a SPIDER in the house!!!!! :0 :C
What should we do?"

puts "
Enter 1 if we should try to catch it.
Enter 2 if we should kill it.
Enter 3 if we should avoid it at all costs.
"
choice = gets.chomp.to_i

if choice == 1 || choice == 2 || choice ==3
  game = GameMaster.new("#{choice}")
else
  puts "Now is no time for jokes! What should we do???"
  puts "
  Enter 1 if we should try to catch it.
  Enter 2 if we should kill it.
  Enter 3 if we should avoid it at all costs.
  "
  choice = gets.chomp.to_i
  if choice == 1 || choice == 2 || choice == 3
    game = GameMaster.new("#{choice}")
  else
    puts "Well, it's clear you're not taking this seriously. Have a nice life!"
    exit!
  end
end

puts "Good idea! Hey, what's your name, by the way?"
$player = gets.chomp
game.name_num("#{$player}")

puts "Well don't worry #{$player}, we'll get through this together!
So where in the house should we go?"
puts "
Enter 1 to go to the LIVING ROOM.
Enter 2 to go to the KITCHEN.
Enter 3 to go to the BATHROOM.
Enter 4 to go to the BEDROOM.
Enter 5 to go to the BASEMENT.
Enter 6 to go to the GARAGE.
"
room = gets.chomp
