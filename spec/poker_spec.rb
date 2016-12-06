require 'rspec'
require 'poker'
require 'card'
require 'deck'
require 'hand'
require 'player'


describe Card do

  subject(:card) { Card.new(2, :hearts) }
  let(:ace_card) { Card.new(1, :clubs, true) }

  it "stores the suit of card object" do
    expect(card.suit).to be_truthy
  end

  it "stores the number of card object" do
    expect(card.number).to be_truthy
  end

  it "handles aces" do
    expect(ace_card.ace).to be(true)
  end
end

describe Deck do

  subject(:deck) { Deck.new }

  it "initializes with a full deck of 52 cards" do
    expect(deck.cards.length).to eq(52)
  end

  it "has an array of cards that matches a standard poker deck" do
    suits = [:hearts, :clubs, :spades, :diamonds]

    suits = suits.map do |suit|
      deck.cards.count {|card| card.suit == suit}
    end

    expect(suits).to eq([13, 13, 13, 13])
  end

  it "has a method #shuffle! which shuffles the deck" do
    tester_deck = deck.cards
    deck.shuffle!
    expect(deck.cards).not_to eq(tester_deck)
  end

  it "pulls out cards after #draw is called" do
    expect(deck.draw).to be_a(Card)
    expect(deck.cards.length).to eq(51)
  end
end

describe Hand do

  card1 = Card.new(1, :clubs, true)
  card2 = Card.new(2, :clubs)
  card3 = Card.new(3, :hearts)
  card4 = Card.new(4, :spades)
  card5 = Card.new(5, :diamonds)
  card6 = Card.new(6, :clubs)
  card7 = Card.new(7, :hearts)
  card8 = Card.new(8, :hearts)
  card9 = Card.new(9, :hearts)
  card10 = Card.new(10, :clubs)
  card11 = Card.new(11, :clubs)
  card12 = Card.new(12, :clubs)
  card13 = Card.new(13, :clubs)

  let(:p1) { double("Herbert", :hand_ranking, :hand => []) }
  let(:p2) { double("Julissa", :hand_ranking, :hand => []) }
  let(:p3) { double("Rick", :hand_ranking, :hand => []) }

  before(:each) do
    allow(p1).to receive(:hand).and_return([card1, card13, card12, card11, card10])
    allow(p2).to receive(:hand).and_return([card3, card4, card5, card6, card7])
    allow(p3).to receive(:hand).and_return([card3, card4, card5, card6, card7])
  end

  before(:each) do
    allow(p1).to receive(:hand_ranking)
    allow(p2).to receive(:hand_ranking)
    allow(p3).to receive(:hand_ranking)
  end

  subject(:hand) { Hand.new(p1, p2, p3) }

  it "accepts an arbitrary number of players" do
    expect(hand.rank_players).to eq(p1)
  end
  # it "calculates each player's hand"
  # it "#ranking(players_cards) returns the relative hand ranking of each player"
  # it "makes sure to correctly calculate aces"
  # it "#flush correctly detects flush"
  # it "#straight correctly detects flush"
  # it "#one_pair correctly detects one pair"
  # it "#two_pair correctly detects two pair"
  # it "#three_pair correctly detects three pair"
  # it "#quads correctly detects quads"
  # it "#full_house detects full houses"
end
