# holds attributes of player
class Player

  START_HEALTH = 60

  attr_reader :name, :health

  def initialize(name)
    @health = START_HEALTH
    name == "" ? @name = create_computer : @name = name
  end

  def deduct_health
    @health -= rand(5..35)
  end

  def create_computer
    'CUNNING AI'
  end
end
