$game_stats = {
  :living_room_visits => 0,
  :kitchen_visits => 0,
  :bathroom_visits => 0,
  :bedroom_visits => 0,
  :basement_visits => 0,
  :garage_visits => 0,
  :total_room_visits => 0,
  :has_item => "empty"
}

def get_item(item, choice)
  if $game_stats[:has_item] != "empty" && choice == 1
    puts "You pick up the #{item} and put down the #{$game_stats[:has_item]}."
    $game_stats[:has_item] = "#{item}"
  elsif choice == 1
    puts "Great. We now have a #{item}."
    $game_stats[:has_item] = "#{item}"
  else
    puts "Cool, yeah what would we do with a dumb old #{item} anyway?"
  end
end

def spider_faceoff
  puts "SPIDER FACEOFF!"

#if/else go to another room for new/different item

  if $game_stats[:objective] == 1 && $game_stats[:has_item] == "cup"
    puts "Using the CUP you found, you gently corral the disoriented spider. As you carry it outside to set it free, your eyes briefly make contact with 3 or 4 of the spider's. In that moment, you make a true connection with this often-maligned - yet largely misunderstood - scared, vulnerable little creatre. You think, 'Heck, it's just as afraid as I am. Aren't we all looking for the same thing in this topsy-turvy ride called life? Peace, love and understanding. Yeah.' Your thought trails off as you find yourself standing at the edge of the backyard, at the precipice of a tearful goodbye with your newfound friend. Inhaling deeply, you release the spider and hold in the swelling of emotion until you can run inside lock yourself in the bedroom, where you cry a whole bunch of tears. The next day you're an emotional wreck. For weeks you are heartbroken, but with the help of concerned friends and family members, you're finally able to put the loss of the only creature that's ever truly KNEW you aside. So it comes as quite a shock several months later when you open your back door and find your spider friend on the stoop, waiting to greet you. The joy you feel in that moment instantly makes all the pain you've experienced melt away. Reaching down, you extend a hand for your dearest of all friends to climb upon. You turn and head back into the house. Together. You convert the #{$game_stats[:spider_location]}, the place where the two of you first met, into a web-strewn spider nest. You come up with a name for your new housemate, and it's perfect: #{$game_stats[:name]} Junior. EVERYTHING is perfect. The days take on a beautiful rhythm, living, laughing and loving together in times of struggle and sharing tender moments that you'll never forget. Then one morning, you open the door to the #{$game_stats[:spider_location]} to find your dearest friend looking slightly shriveled. #{$game_stats[:name]} Jr. is dying! Fighting back the tears, you say goodbye, one last time. Devastated though you are, you know the time you two had together was a gift. You take comfort in knowing there are no regrets. After posting your thoughts and feelings on social media, mainstream news sites start to pick up your story. People all over the world are moved by your experiences, vowing to treat the arachnids with whom we share this planet with a greater sense of tolerance and openness. A new age begins as human and spider species begin to overlap, merge and finally evolve into a higher form of life. War and poverty are eliminated. The world is saved, and it's all because of you and #{$game_stats[:name]} Junior. Congrats!"
  elsif $game_stats[:objective] == 1 && $game_stats[:has_item] == "jar"
    puts "WIN! You trap the spider with the jar."
  elsif $game_stats[:objective] == 1 && $game_stats[:has_item] == "shovel"
    puts "You stand aghast"
  elsif $game_stats[:objective] == 1 && $game_stats[:has_item] == "book"
    puts "LOSE! Your book is no good for catching!"
  elsif $game_stats[:objective] == 1 && $game_stats[:has_item] == "blanket"
    puts "LOSE! Your blanket is no good for catching!"
  elsif $game_stats[:objective] == 1 && $game_stats[:has_item] == "raincoat"
    puts "LOSE! Raincoat is no good for catching!"

  elsif $game_stats[:objective] == 2 && $game_stats[:has_item] == "cup"
    puts "LOSE! The cup is no good for killing."
  elsif $game_stats[:objective] == 2 && $game_stats[:has_item] == "jar"
    puts "LOSE! The jar is no good for killing"
  elsif $game_stats[:objective] == 2 && $game_stats[:has_item] == "shovel"
    puts "WIN! Shovel kills spider!"
  elsif $game_stats[:objective] == 2 && $game_stats[:has_item] == "book"
    puts "WIN! Book kills spider!"
  elsif $game_stats[:objective] == 2 && $game_stats[:has_item] == "blanket"
    puts "LOSE! Your blanket is no good for killing!"
  elsif $game_stats[:objective] == 2 && $game_stats[:has_item] == "raincoat"
    puts "LOSE! The raincoat is no good for killing!"

  elsif $game_stats[:objective] == 3 && $game_stats[:has_item] == "cup"
    puts "LOSE! Cup no help avoid"
  elsif $game_stats[:objective] == 3 && $game_stats[:has_item] == "jar"
    puts "LOSE! Jar no help avoid!"
  elsif $game_stats[:objective] == 3 && $game_stats[:has_item] == "shovel"
    puts "LOSE! The shovel is no good for avoiding!"
  elsif $game_stats[:objective] == 3 && $game_stats[:has_item] == "book"
    puts "LOSE! Your book is no good for avoiding!"
  elsif $game_stats[:objective] == 3 && $game_stats[:has_item] == "blanket"
    puts "WIN! Your blanket shields you!"
  elsif $game_stats[:objective] == 3 && $game_stats[:has_item] == "raincoat"
    puts "WIN! The raincoat shields you!"
  else puts "Choosing to face the spider empty handed was a bad idea. It bites you and you die."
  end

  exit!
end

def living_room
  $game_stats[:living_room_visits] += 1
  $game_stats[:total_room_visits] += 1
  $game_stats[:current_room] = "living room"
  puts "
    Sure, let's go to the living room...
    "
  sleep 2
  if $game_stats[:current_room] == $game_stats[:spider_location]
    puts "AIEEEE!"
    spider_faceoff
  elsif $game_stats[:living_room_visits] > 1
    puts "Everything looks the same as before."
    sleep 1
    if $game_stats[:has_item] != "blanket"
      puts "
      That BLANKET is still over there if you want it!"
      sleep 1
      puts "
      Do you want to pick up the blanket? Enter 1 for YES or 2 for NO."
      $game_stats[:take_item] = gets.chomp.to_i
      response_filter("take_item", $game_stats[:take_item], [1, 2], "
      Enter 1 for YES, I want the BLANKET, or 2 for NO, I DO NOT want the dang BLANKET!
      ")

      get_item("blanket", $game_stats[:take_item])
    else
    end
  else
    puts "You don't see anything unusual upon entering, so you pop your ass down on the couch. Looking around, you notice a television set, some Live-Laugh-Love-styled word art, and a very classy sectional sofa with built-in cup holders on the arm rests.
    You also notice a neatly-folded blanket hanging over the back of one chair. Should we take it?"
    sleep 1
    puts "Enter 1 to take the blanket, or 2 to leave it here."
    $game_stats[:take_item] = gets.chomp.to_i
    response_filter("take_item", $game_stats[:take_item], [1, 2], "
    Enter 1 for YES, I want the BLANKET, or 2 for NO, I DO NOT want the dang BLANKET!
    ")
    get_item("blanket", $game_stats[:take_item])
  end
  sleep 2

  puts "Well, I think we've seen enough of the living room. Where should we go next?"
  sleep 1
  puts "
  Enter 2 to go to the KITCHEN.
  Enter 3 to go to the BATHROOM.
  Enter 4 to go to the BEDROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
  "

  $game_stats[:room] = gets.chomp.to_i

  response_filter("room", $game_stats[:room], [2, 3, 4, 5, 6], "
  Enter 2 to go to the KITCHEN.
  Enter 3 to go to the BATHROOM.
  Enter 4 to go to the BEDROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
    ")

  room_sender($game_stats[:room])
end

def kitchen

  $game_stats[:kitchen_visits] += 1
  $game_stats[:total_room_visits] += 1
  $game_stats[:current_room] = "kitchen"
  puts "
    Sure, let's go to the kitchen...
    "
  if $game_stats[:current_room] == $game_stats[:spider_location]
    puts "AIEEEE!"
    spider_faceoff
  elsif $game_stats[:kitchen_visits] > 1
    puts "Here we are again. Are you still hungry or something?"

    if $game_stats[:has_item] != "cup"
      puts "That CUP is still over on the table...
      Do you want to pick up the cup? Enter 1 for YES or 2 for NO."
      $game_stats[:take_item] = gets.chomp.to_i
      response_filter("take_item", $game_stats[:take_item], [1, 2], "
      Enter 1 for YES, I want the CUP, or 2 for NO, I DO NOT want the dang CUP!
      ")
      get_item("cup", $game_stats[:take_item])
    else
    end
  else
    puts "You step into the kitchen and look around. No spider in sight, so you mosey on over to the fridge and grab yourself a Go-Gurt.
    It's then that you notice an empty CUP on the kitchen table. It might come in handy ...should we take it with us?"
    puts "Enter 1 to take the cup, or 2 to leave it here."
    $game_stats[:take_item] = gets.chomp.to_i
    response_filter("take_item", $game_stats[:take_item], [1, 2], "
    Enter 1 for YES, I want the CUP, or 2 for NO, I DO NOT want the dang CUP!
    ")
    get_item("cup", $game_stats[:take_item])
  end

  puts "Well, I think we've seen enough of this room. Where should we go next?"
  puts "
  Enter 1 to go to the LIVING ROOM.
  Enter 3 to go to the BATHROOM.
  Enter 4 to go to the BEDROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
  "

  $game_stats[:room] = gets.chomp.to_i

  response_filter("room", $game_stats[:room], [1, 3, 4, 5, 6], "
  Enter 1 to go to the LIVING ROOM.
  Enter 3 to go to the BATHROOM.
  Enter 4 to go to the BEDROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
  ")

  room_sender($game_stats[:room])
end

def bathroom

  $game_stats[:bathroom_visits] += 1
  $game_stats[:total_room_visits] += 1
  $game_stats[:current_room] = "bathroom"
  puts "
    Let's investigate the bathroom...
    "
  if $game_stats[:current_room] == $game_stats[:spider_location]
    puts "AIEEEE!"
    spider_faceoff
  elsif $game_stats[:bathroom_visits] > 1
    puts "Yep, looks like the bathroom. Nothing new here!"

    if $game_stats[:has_item] != "jar"
      puts "That JAR is still on the counter.
      Do you want to pick up the jar? Enter 1 for YES or 2 for NO."
      $game_stats[:take_item] = gets.chomp.to_i
      response_filter("take_item", $game_stats[:take_item], [1, 2], "
      Enter 1 for YES, I want the JAR, or 2 for NO, I DO NOT want the dang JAR!
      ")
      get_item("jar", $game_stats[:take_item])
    else
    end
  else
    puts "The first thing you notice about the water closet is every wall is covered by pictures of cocker spaniel dogs: paintings, photos, cross-stitch art, and a special shrine for Arthur, the famous pet of none other than Sir Elton John.
    You also notice a cluster of cotton balls being kept tastefully in a pink glass JAR. It could be useful later ...should we bring it?"
    puts "Enter 1 to take the jar, or 2 to leave it here."
    $game_stats[:take_item] = gets.chomp.to_i
    response_filter("take_item", $game_stats[:take_item], [1, 2], "
    Enter 1 for YES, I want the JAR, or 2 for NO, I DO NOT want the dang JAR!!!!!
    ")
    get_item("jar", $game_stats[:take_item])
  end

  puts "Well, it's a little crowded in here. Can we please go somewhere else?"
  puts "
  Enter 1 to go to the LIVING ROOM.
  Enter 2 to go to the KITCHEN.
  Enter 4 to go to the BEDROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
  "

  $game_stats[:room] = gets.chomp.to_i

  response_filter("room", $game_stats[:room], [1, 2, 4, 5, 6], "
  Enter 1 to go to the LIVING ROOM.
  Enter 2 to go to the KITCHEN.
  Enter 4 to go to the BEDROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
  ")

  room_sender($game_stats[:room])
end

def bedroom

  $game_stats[:bedroom_visits] += 1
  $game_stats[:total_room_visits] += 1
  $game_stats[:current_room] = "bedroom"
  puts "
    Ok, we can go to the bedroom ...but don't get any ideas!
    "
  if $game_stats[:current_room] == $game_stats[:spider_location]
    puts "AIEEEE!"
    spider_faceoff
  elsif $game_stats[:bedroom_visits] > 1
    puts "Well, here we are in the bedroom again. Why do you keep bringing me back here, hmmmmm??"

    if $game_stats[:has_item] != "raincoat"
      puts "That RAINCOAT is still hanging in the closet.
      Do you want to put on the RAINCOAT? Enter 1 for YES or 2 for NO."
      $game_stats[:take_item] = gets.chomp.to_i
      response_filter("take_item", $game_stats[:take_item], [1, 2], "
      Enter 1 for YES, I want the RAINCOAT, or 2 for NO, I DO NOT want the dang RAINCOAT!
      ")
      get_item("raincoat", $game_stats[:take_item])
    else
    end
  else
    puts "
    Just as you would expect, there is a bed in this room. Hence it's a BEDROOM. Get it, BED? ROOM?? Oh nevermind. You humans have no concept of string concatenation.
    Oh, but look there's also a closet! And there's a RAINCOAT hanging in there. Should we put it on?
    "

    puts "Enter 1 to take the raincoat, or 2 to leave it here."
    $game_stats[:take_item] = gets.chomp.to_i
    response_filter("take_item", $game_stats[:take_item], [1, 2], "
    Enter 1 for YES, I want the RAINCOAT, or 2 for NO, I DO NOT want the dang RAINCOAT!!!!!
    ")
    get_item("raincoat", $game_stats[:take_item])
  end

  puts "Well, to be honest I feel a little awkward just sitting with you here in the bedroom. No offense.
  Anyway, where should we go next?"
  puts "
  Enter 1 to go to the LIVING ROOM.
  Enter 2 to go to the KITCHEN.
  Enter 3 to go to the BATHROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
  "

  $game_stats[:room] = gets.chomp.to_i

  response_filter("room", $game_stats[:room], [1, 2, 3, 5, 6], "
  Enter 1 to go to the LIVING ROOM.
  Enter 2 to go to the KITCHEN.
  Enter 3 to go to the BATHROOM.
  Enter 5 to go to the BASEMENT.
  Enter 6 to go to the GARAGE.
  ")

  room_sender($game_stats[:room])
end

def basement

    $game_stats[:basement_visits] += 1
    $game_stats[:total_room_visits] += 1
    $game_stats[:current_room] = "basement"
    puts "
      We can check out the basement, I just hope it's not too creepy down there!
      "
    if $game_stats[:current_room] == $game_stats[:spider_location]
      puts "AIEEEE!"
      spider_faceoff
    elsif $game_stats[:basement_visits] > 1
      puts "Oh yeah, that's right. The basement is actually a very pleasant living space!"

      if $game_stats[:has_item] != "book"
        puts "That BOOK is still over there on the shelf.
        Did you want to grab that? Enter 1 for YES or 2 for NO."
        $game_stats[:take_item] = gets.chomp.to_i
        response_filter("take_item", $game_stats[:take_item], [1, 2], "
        Enter 1 for YES, I want the BOOK, or 2 for NO, I DO NOT want the dang BOOK!!!!!!!!
        ")
        get_item("book", $game_stats[:take_item])
      else
      end
    else
      puts "
      Your fears of a dark, dingy, concrete confines are quickly assuaged as you step into the fully finished - and actually quite cozy - basement living space. Complete with carpet, a papason chair, and decorative musical instruments on the walls, this would be a great place to sit and read one of the may books from the shelf.
      There's a particularly hefty BOOK titled 'Gravity's Rainbow' on the shelf. Do we take it with us?
      "

      puts "Enter 1 to take the book, or 2 to leave it here."
      $game_stats[:take_item] = gets.chomp.to_i
      response_filter("take_item", $game_stats[:take_item], [1, 2], "
      Enter 1 for YES, I want the BOOK, or 2 for NO, I DO NOT want the dang BOOK!!!!!
      ")
      get_item("book", $game_stats[:take_item])
    end

    puts "So that's the basement. Where should we go next?"
    puts "
    Enter 1 to go to the LIVING ROOM.
    Enter 2 to go to the KITCHEN.
    Enter 3 to go to the BATHROOM.
    Enter 4 to go to the BEDROOM.
    Enter 6 to go to the GARAGE.
    "

    $game_stats[:room] = gets.chomp.to_i

    response_filter("room", $game_stats[:room], [1, 2, 3, 4, 6], "
    Enter 1 to go to the LIVING ROOM.
    Enter 2 to go to the KITCHEN.
    Enter 3 to go to the BATHROOM.
    Enter 4 to go to the BEDROOM.
    Enter 6 to go to the GARAGE.
    ")

    room_sender($game_stats[:room])
end

def garage

      $game_stats[:garage_visits] += 1
      $game_stats[:total_room_visits] += 1
      $game_stats[:current_room] = "garage"
      puts "
        To the garage we go!
        "
      if $game_stats[:current_room] == $game_stats[:spider_location]
        puts "AIEEEE!"
        spider_faceoff
      elsif $game_stats[:garage_visits] > 1
        puts "Once again, we re-enter the previously visited garage that we have already been to. Why are we here?"

        if $game_stats[:has_item] != "shovel"
          puts "There's that SHOVEL. Is that what we came for?
          Enter 1 to GRAB the shovel, or 2 to LEAVE IT HERE."
          $game_stats[:take_item] = gets.chomp.to_i
          response_filter("take_item", $game_stats[:take_item], [1, 2], "
          Enter 1 for YES, I want the SHOVEL, or 2 for NO, I DO NOT WANT THE DANG SHOVEL!!!!!!!!
          ")
          get_item("shovel", $game_stats[:take_item])
        else
        end
      else
        puts "
        Cold, poorly lit, and filled with random crap, the garage is about what you'd expect. No spiders to be seen, though. You survey the piles of expired coupons, barrels of empty Red Bull cans, and stacks of Rob Schneider comedies on VHS.
        You also happen to spot some yard tools in the corner, including a nice big SHOVEL ...should we take it with us?
        "

        puts "Enter 1 to take the shovel, or 2 to leave it here."
        $game_stats[:take_item] = gets.chomp.to_i
        response_filter("take_item", $game_stats[:take_item], [1, 2], "
        Enter 1 for YES, I want the SHOVEL, or 2 for NO, I DO NOT want the dang SHOVEL!!!!!
        ")
        get_item("shovel", $game_stats[:take_item])
      end

      puts "Can we leave the garage now? I'm cold. Where should we go?"
      puts "
      Enter 1 to go to the LIVING ROOM.
      Enter 2 to go to the KITCHEN.
      Enter 3 to go to the BATHROOM.
      Enter 4 to go to the BEDROOM.
      Enter 5 to go to the BASEMENT.
      "

      $game_stats[:room] = gets.chomp.to_i

      response_filter("room", $game_stats[:room], [1, 2, 3, 4, 5], "
      Enter 1 to go to the LIVING ROOM.
      Enter 2 to go to the KITCHEN.
      Enter 3 to go to the BATHROOM.
      Enter 4 to go to the BEDROOM.
      Enter 5 to go to the BASEMENT.
      ")

      room_sender($game_stats[:room])
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
    puts "Seriously! #{$game_stats[:name]} WHAT SHOULD WE DO???"
    puts "
    #{choices}
    "
    new_response = gets.chomp.to_i
    if acceptable_responses.include?(new_response) == true
      $game_stats[:"#{name}"] = new_response
    else
      puts "OMG I guess I'll just deal with the spider myself. Have a nice life!"
      exit!
    end
  end
end

def spider_locator
  if $game_stats[:threemainder] == 0 && $game_stats[:over5] == false
    $game_stats[:spider_location] = "living room"
  elsif $game_stats[:threemainder] == 0 && $game_stats[:over5] == true
      $game_stats[:spider_location] = "kitchen"
  elsif $game_stats[:threemainder] == 1 && $game_stats[:over5] == false
      $game_stats[:spider_location] = "bathroom"
  elsif $game_stats[:threemainder] == 1 && $game_stats[:over5] == true
      $game_stats[:spider_location] = "bedroom"
  elsif $game_stats[:threemainder] == 2 && $game_stats[:over5] == false
      $game_stats[:spider_location] = "basement"
  elsif $game_stats[:threemainder] == 2 && $game_stats[:over5] == true
      $game_stats[:spider_location] = "garage"
  else
    $game_stats[:spider_location] = "garage"
  end
end

def room_sender(room_num)
  if room_num == 1
    living_room
  elsif room_num == 2
    kitchen
  elsif room_num == 3
    bathroom
  elsif room_num == 4
    bedroom
  elsif room_num == 5
    basement
  else
    garage
  end
  sleep 1
end

################### GAME START ####################
puts "
HOLY CRAP! There's a SPIDER in the house!!!!!"
sleep 1
puts " :0"
sleep 0.5
puts " :("
sleep 2
puts "
What should we do?"
sleep 1.5
puts "
Enter 1 if we should CATCH it.
Enter 2 if we should KILL it.
Enter 3 if we should AVOID it at all costs.
"

choice = gets.chomp.to_i

response_filter("objective", choice, [1, 2, 3], "
Enter 1 if we should CATCH it.
Enter 2 if we should KILL it.
Enter 3 if we should AVOID it.
  ")
sleep 1
puts "
Good idea! Hey, what's your name, by the way?
"

player = gets.chomp
name_num("#{player}")

spider_locator
sleep 1
puts "
Well don't worry #{player}, we'll get through this together!
"
sleep 1
puts "
So where in the house should we go?
"
sleep 1.5
puts "
Enter 1 to go to the LIVING ROOM.
Enter 2 to go to the KITCHEN.
Enter 3 to go to the BATHROOM.
Enter 4 to go to the BEDROOM.
Enter 5 to go to the BASEMENT.
Enter 6 to go to the GARAGE.
"

#choice = gets.chomp.to_i
$game_stats[:room] = gets.chomp.to_i

response_filter("room", $game_stats[:room], [1, 2, 3, 4, 5, 6], "
Enter 1 to go to the LIVING ROOM.
Enter 2 to go to the KITCHEN.
Enter 3 to go to the BATHROOM.
Enter 4 to go to the BEDROOM.
Enter 5 to go to the BASEMENT.
Enter 6 to go to the GARAGE.
  ")

room_sender($game_stats[:room])
