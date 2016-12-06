require_relative 'card.rb'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    populate
    shuffle!
  end

  def populate
    (0..3).each do |suit|
      color = get_suit(suit)
      (1..13).each do |num|
        if num == 1
          @cards << Card.new(num, color, true)
        else
          @cards << Card.new(num, color)
        end
      end
    end
  end

  def shuffle!
    @cards = @cards.shuffle
  end

  def draw
    @cards.pop
  end

  private

  def get_suit(num)
    case num
    when 0
      :clubs
    when 1
      :hearts
    when 2
      :diamonds
    when 3
      :spades
    end
  end
end
