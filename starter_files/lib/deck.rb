require_relative "card"

class Deck
  def initialize
    @cards = []
    @suits = [:clubs, :diamonds, :hearts, :spades]
    @ranks = Card.ranks

    @suits.each do |suit|
      @ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def cards_left
    @cards.length
  end

  def draw
    @cards.shift
  end

  def shuffle
    @cards.shuffle
  end
end
