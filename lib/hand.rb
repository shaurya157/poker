require_relative 'deck.rb'
require_relative 'player.rb'
require 'byebug'
class Hand
  attr_accessor :players
  def initialize(*players)
    @players = players
  end

  def rank_players
    @players.each do |player|
      set_hand_rank(player)
    end
    pick_winners
  end

  def pick_winners
    @players.sort {|player| player.hand_ranking}
    temp_winner = @players[0]
    winners = []
    @players.each do |player|
      winners << player if player.hand_ranking == temp_winner.hand_ranking
    end

    winners.length == 1 ? winners.first : process_ties(winners)
  end

  def process_ties(winners)
  end

  private

  def royal_flush?(player)
    straight_flush?(player) && player.hand.all? {|card| card.number >= 10 || card.number == 1}
  end

  def straight_flush?(player)
    flush?(player) && straight?(player)
  end

  def flush?(player)
    hand = player.hand.map {|card| card.suit}
    checker = hand[0]
    hand.all? { |suit| suit == checker }
  end

  def straight?(player)
    hand = get_hands(player).sort
    if hand[0] == 1
      hand.include?(13) ? hand[0] = 14 : hand[0] = 1
    end

    hand.sort.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def full_house?(player) #will work cuz quads are greater
    hands = get_hands(player)
    hands.uniq.length == 2
  end

  def quads?(player)
    hands = get_hands(player)
    hands.any? {|num| hands.count(num) == 4}
  end

  def three_kind?(player)
    hands = get_hands(player)
    hands.any? {|num| hands.count(num) == 3}
  end

  def two_pair?(player)
    hands = get_hands(player)
    hands.uniq.length == 3
  end

  def pair?(player)
    hands = get_hands(player)
    hands.uniq.length == 4
  end

  def get_hands(player)
    player.hand.map { |card| card.number }
  end

  def set_hand_rank(player)
    if  royal_flush?(player)
      player.hand_ranking = 1
    elsif straight_flush?(player)
      player.hand_ranking = 2
    elsif quads?(player)
      player.hand_ranking = 3
    elsif full_house?(player)
      player.hand_ranking = 4
    elsif flush?(player)
      player.hand_ranking = 5
    elsif straight?(player)
      player.hand_ranking = 6
    elsif three_kind?(player)
      player.hand_ranking = 7
    elsif two_pair?(player)
      player.hand_ranking = 8
    elsif pair?(player)
      player.hand_ranking = 9
    else
      player.hand_ranking = 10
    end
  end
end

deck = Deck.new
card1 = Card.new(2, :clubs)
card13 = Card.new(3, :clubs)
card12 = Card.new(4, :clubs)
card11 = Card.new(5, :clubs)
card10 = Card.new(6, :clubs)
hand = [card1, card13, card11, card12, card10]
player1 = Player.new("A", hand)
rank_checker = Hand.new(player1)
rank_checker.rank_players
p player1.hand_ranking
