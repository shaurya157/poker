class Player
  attr_accessor :hand, :hand_ranking
  def initialize(name, hand, hand_ranking = 0)
    @name = name
    @hand = hand
    @hand_ranking = hand_ranking
  end
end
