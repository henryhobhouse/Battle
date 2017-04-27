# holds attributes of player
class Player

  attr_reader :name, :health

  def initialize(name)
    @health = 60
    @name = name
  end

end
