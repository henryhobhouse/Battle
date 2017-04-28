# Allows players to attack each other and control results
class Game

  attr_reader :player_one, :player_two, :player_turn

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @player_turn = player_one
  end

  def attack(player)
    player.deduct_health
  end

  def process_attack
    player_turn_swap
    attack(player_turn)
  end

  def is_computer
    @player_two.name == 'CUNNING AI' ? @player_two.name : nil
  end

  def player_turn_swap
    if @player_turn == @player_one; @player_turn = @player_two
    else @player_turn = @player_one; end
  end

  def self.create(player_one, player_two)
      @instance_capture = Game.new(player_one, player_two)
  end

  def self.load
    @instance_capture
  end

end
