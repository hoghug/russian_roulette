class Game
  attr_reader :players, :chambers, :loaded_chamber

  def initialize(num_players)
    @players = Array(1..(num_players))
    @chambers = Array(1..(6))
  end

  def load_chamber(chamber_num)
    @loaded_chamber = chamber_num
  end

  def spin_cylinder
    @revolver_spins = rand(0..10)
    @revolver_spins.times { @chambers << @chambers.shift }
  end

  def player_turn
    @players[0]
  end

  def pull_trigger
    if @chambers[0] == @loaded_chamber
      return true
    else
      @chambers.shift
      @players << @players.shift
      return false
    end
  end

end
