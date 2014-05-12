require './lib/game.rb'

def start_game
  puts "How many players?"
  game = Game.new(gets.chomp.to_i)
  puts "Choose a chamber to load the bullet... (1-6)"
  game.load_chamber(gets.chomp.to_i)
  game.spin
  print game.chambers
  fire_gun(game)
end

def fire_gun(game)
  puts "Player #{game.player_turn}: Press ENTER to pull trigger"
  gets.chomp
  if game.pull_trigger
    puts "Player #{game.player_turn} is DEAD"
    puts "Play again?"
    gets.chomp
    start_game
  else
    puts "You're SAFE, next..."
    fire_gun(game)
  end
end

start_game
