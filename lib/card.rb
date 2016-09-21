class Card
  attr_accessor :number, :suit, :ace

  def initialize(number, suit, ace = false)
    @number = number
    @suit = suit
    @ace = ace
  end


end
