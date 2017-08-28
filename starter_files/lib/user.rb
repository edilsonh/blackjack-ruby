class User

  def initialize
    @money = 100
    @hand = []
  end

  def money
    @money
  end

  def hand
    @hand
  end

  def bet
    @money -= 10
  end

  def win
    @money += (10 * 3/2)
  end

end
