# Allows players to attack each other and control results
class Game

  attr_reader :player_one, :player_two

  def initialize(player_one = 'test_player_one', player_two = 'test_player_two')
    @player_one = player_one
    @player_two = player_two
  end

  def attack(player)
    player.deduct_health
  end

end
