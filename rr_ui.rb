require './lib/game.rb'

def start_game
  puts "How many players?"
  game = Game.new(gets.chomp.to_i)
  puts "Choose a chamber to load the round into... (1-6)"
  game.load_chamber(gets.chomp.to_i)
  game.spin_cylinder
  fire_gun(game)
end

def fire_gun(game)
  puts "Player #{game.player_turn}: Press ENTER to pull the trigger"
  gets.chomp
  if game.pull_trigger
    puts "Player #{game.player_turn} is DEAD"
    puts "Play again? (y/n)"
    if gets.chomp == 'y'
      start_game
    else 
      system('clear')
    end
  else
    puts "You're SAFE, next..."
    fire_gun(game)
  end
end

start_game