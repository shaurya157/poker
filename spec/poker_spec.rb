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

  it "has a method #shuffle which shuffles the deck" do
    tester_deck = deck.cards
    deck.shuffle
    expect(deck.cards).not_to eq(tester_deck)
  end
end
