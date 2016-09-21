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
