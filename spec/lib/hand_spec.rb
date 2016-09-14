require "spec_helper"
require 'pry'

RSpec.describe Hand do
  let(:hand_1) { Hand.new([Card.new('A', '♣'), Card.new('J','♥')]) }
  let(:hand_2) { Hand.new([Card.new('A', '♣'), Card.new('4', '♣')]) }
  let(:hand_3) { Hand.new([Card.new('Q', '♣'), Card.new('J', '♥')]) }

  let(:card_1) { Card.new('4','♣') }

  # split test cases
  let(:hit_1) { Hand.new([Card.new('J♥')]) }
  let(:hit_2) { Hand.new([Card.new('A♥')]) }
  let(:hit_3) { Hand.new([Card.new('4♣')]) }

  describe "#display_hand" do
    it "displays the current hand" do
      expect(hand_1.display_hand).to eq('A♣, J♥')
      expect(hand_2.display_hand).to eq('A♣, 4♣')
      expect(hand_3.display_hand).to eq('Q♣, J♥')
    end
  end

  describe "#hit" do
    it "it draws one card and adds the player/dealer's hand" do
      # pass in card to `hit` method
      # check that the array of hand_1.cards is updated
      hand_1.hit(card_1)

      binding.pry
      expect(hand_1.cards.count).to eq 3
      expect(hand_1.cards).to eq [ card_1, card_2, card_3 ]
    end
  end
  describe "#score" do
    it "adds up the score of cards dealt" do
      expect(hand_1.score).to eq(21)
      expect(hand_2.score).to eq(15)
      expect(hand_3.score).to eq(20)
    end
  end
end
