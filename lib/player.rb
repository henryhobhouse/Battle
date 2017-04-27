# holds attributes of player
class Player

  attr_accessor :health
  attr_reader :name

  def initialize(name)
    @health = 60
    @name = name
  end

end
