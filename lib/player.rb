# holds attributes of player
class Player

  attr_reader :name, :health

  def initialize(name = 'test')
    @health = 60
    @name = name
  end

  def deduct_health
    @health -= 10
  end
end
