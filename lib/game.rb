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

  def save
    @@instance_capture = self
  end

  def self.load
    @@instance_capture
  end

  def player_turn_swap
    if @player_turn == @player_one; @player_turn = @player_two
    else @player_turn = @player_one; end
  end

end
