class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def display_hand
    display = @cards.map { |card| card.show_card }.join(", ")
    display
  end

  # assume that we're getting just 1 card (so `deck.deal(1)`)
  # but we know that `.deal` calls `.pop` with an argument
  # so we are getting an array back - not a single card

  # instead, we made a `deck.draw!` method that pops just a
  # single card object from the cards array of the deck.

  # we can assume we're getting a single Card object as
  # the argument
  def hit(card)
    @cards << card
  end

  def bust?
    score > 21
  end

  def blackjack?
    score == 21 && @cards.count == 2
  end

  def score
    total_score = 0
    @cards.each do |card|
        # binding.pry
      if card.face_card?
        total_score += 10
      elsif card.ace? && total_score > 10
        total_score += 1
      elsif card.ace? && total_score < 10
        total_score += 11
      else
        total_score += card.rank.to_i
      end
    end
    total_score
  end
end
