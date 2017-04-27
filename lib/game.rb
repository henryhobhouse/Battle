# Allows players to attack each other and control results
class Game

  def attack(player)
    player.deduct_health
  end

end
