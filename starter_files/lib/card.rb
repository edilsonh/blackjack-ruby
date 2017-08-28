class Card

  def initialize (rank, suit)
    @rank = rank
    @suit = suit
  end

  def suit
    @suit
  end

  def rank
    @rank
  end

  def greater_than? (card)
    value > card.value
  end

  def value (rank)
    ranks.index(self.rank)
  end

  def self.ranks
    [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  end

  def ==(card)
    self.suit == card.suit &&
    self.rank == card.rank
  end

  def value
    self.class.ranks.index(self.rank)
  end
end
