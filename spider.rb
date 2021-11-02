$game_stats = {
  :living_room_visits => 0,
  :kitchen_visits => 0,
  :bathroom_visits => 0,
  :bedroom_visits => 0,
  :basement_visits => 0,
  :garage_visits => 0,
  :total_room_visits => 0
}

def living_room
  $game_stats[:living_room_visits] += 1
  $game_stats[:total_room_visits] += 1
  $game_stats[:current_room] = 1
  puts "
    Sure, let's go to the living room...
    "
  if $game_stats[:current_room] == $game_stats[:spider_location]
    puts "AIEEEE!"
    spider_faceoff
  elsif $game_stats[:living_room_visits] > 1

    puts "Everything looks the same as before."
    if $game_stats[:has_item] != "blanket"
      puts "That BLANKET is still over there if u want it!
      Do you want to pick up the blanket? Enter 1 for YES or 2 for NO."
      choice = gets.chomp.to_i
      response_filter("blanket", choice, [1, 2], "
      Enter 1 for YES, I want the BLANKET, or 2 for NO, I DO NOT want the dang BLANKET!
      ")
      get_item("blanket", choice)
    else
    end
  else
    puts "You don't see anything unusual upon entering, so you pop your ass down on the couch. Looking around, you notice a television set, some Live-Laugh-Love-styled word art, and a very tasteful sectional sofa with built-in cup holders on the arm rests. You also notice a neatly-folded blanket hanging over the back of one chair. It might come in handy...should we take it?"
    puts "Enter 1 to take the blanket, or 2 to leave it here."
    choice = gets.chomp.to_i
    response_filter("blanket", choice, [1, 2], "
    Enter 1 for YES, I want the BLANKET, or 2 for NO, I DO NOT want the dang BLANKET!
    ")
    get_item("blanket",choice)
  end

  puts "Well, I think we've seen enough of this room. Where should we go next?"
  puts "Enter 1 to go to the LIVING ROOM.
  Enter 2 to go to the KITCHEN.
  Enter 3 to go to the BATHROOM.
  Enter 4 to go to the BEDROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
  "

  choice = gets.chomp.to_i

  response_filter("room", choice, [1, 2, 3, 4, 5, 6], "
  Enter 1 to go to the LIVING ROOM.
  Enter 2 to go to the KITCHEN.
  Enter 3 to go to the BATHROOM.
  Enter 4 to go to the BEDROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
    ")

  room_sender(choice)
end

def get_item(item, choice)
  if choice == 1
    $game_stats[has_item: "#{item}"]
    puts "Great. We now have a blanket."
  else
    puts "Cool, yeah what would we do with a dumb old #{item} anyway?"
  end
end

def spider_faceoff
  puts "SPIDER FACEOFF!"
  exit!
end

def kitchen
  puts "
Sure, let's go to the kitchen...

"
end

def bathroom
  puts "
Sure, let's go to the bathroom...

"
end

def bedroom
  puts "
Sure, let's go to the bedroom...

"
end

def basement
  puts "
Sure, let's go to the basement...

"
end

def garage
  puts "
Sure, let's go to the garage...

"
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
end

def response_filter(name, response, acceptable_responses, choices)
  if acceptable_responses.include?(response) == true
    $game_stats[:"#{name}"] = response
  else
    puts "This is no time for jokes! What should we do???"
    puts "
    #{choices}
    "
    new_response = gets.chomp.to_i
    if acceptable_responses.include?(new_response) == true
      $game_stats[:"#{name}"] = new_response
    else
      puts "Well, it's clear you're not taking this seriously. Have a nice life!"
      exit!
    end
  end
end

def spider_locator
  if $game_stats[:threemainder] == 0 && $game_stats[:over5] == false
    $game_stats[:spider_location] = 1
  elsif $game_stats[:threemainder] == 0 && $game_stats[:over5] == true
      $game_stats[:spider_location] = 2
  elsif $game_stats[:threemainder] == 1 && $game_stats[:over5] == false
      $game_stats[:spider_location] = 3
  elsif $game_stats[:threemainder] == 1 && $game_stats[:over5] == true
      $game_stats[:spider_location] = 4
  elsif $game_stats[:threemainder] == 2 && $game_stats[:over5] == false
      $game_stats[:spider_location] = 5
  elsif $game_stats[:threemainder] == 2 && $game_stats[:over5] == true
      $game_stats[:spider_location] = 6
  else
    $game_stats[:spider_location] = 6
  end

  #puts "The spider is in the #{$game_stats[:spider_location]}."
end

def room_sender(room_num)
  if room_num == 1
    living_room
  elsif room_num == 2
    kitchen
  elsif room_num == 3
    bathroom
  elsif room_num == 4
    kitchen
  elsif room_num == 5
    bathroom
  else
    garage
  end
end

################### INTRO ####################
puts "
HOLY CRAP! There's a SPIDER in the house!!!!! :0 :(

What should we do?"

puts "
Enter 1 if we should try to catch it.
Enter 2 if we should kill it.
Enter 3 if we should avoid it at all costs.
"

choice = gets.chomp.to_i

response_filter("objective", choice, [1, 2, 3], "
Enter 1 if we should try to catch it.
Enter 2 if we should kill it.
Enter 3 if we should avoid it at all costs.
  ")

puts "Good idea! Hey, what's your name, by the way?"

player = gets.chomp
name_num("#{player}")

spider_locator

puts "
Well don't worry #{player}, we'll get through this together!

So where in the house should we go?"
puts "
Enter 1 to go to the LIVING ROOM.
Enter 2 to go to the KITCHEN.
Enter 3 to go to the BATHROOM.
Enter 4 to go to the BEDROOM.
Enter 5 to go to the BASEMENT.
Enter 6 to go to the GARAGE.
"

choice = gets.chomp.to_i

response_filter("room", choice, [1, 2, 3, 4, 5, 6], "
Enter 1 to go to the LIVING ROOM.
Enter 2 to go to the KITCHEN.
Enter 3 to go to the BATHROOM.
Enter 4 to go to the BEDROOM.
Enter 5 to go to the BASEMENT.
Enter 6 to go to the GARAGE.
  ")

room_sender(choice)
