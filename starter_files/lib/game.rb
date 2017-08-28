require_relative "deck"
require_relative "user"
require_relative "dealer"
class Game

  def initialize
    @deck =  Deck.new
    @user = User.new
    @dealer = Dealer.new
  end

  def user
    @user
  end

  def dealer
    @dealer
  end

  def deck
    @deck
  end

  def shuffle_deck
    @deck = @deck.shuffle
  end

  def user_draw
    @user.hand<<@deck.shift
  end

  def dealer_draw
    @dealer.hand<<@deck.shift
  end

  def hand_total
    @hand_total
  end

  def current_hand
    @hand_total = 0
    hand_iteration = @user.hand.length - 1

    puts "Your current hand is: "

    for i in 0..hand_iteration
      if (@user.hand[i].rank == :K) || (@user.hand[i].rank == :Q) || (@user.hand[i].rank == :J) || (@user.hand[i].rank == :A)
        @hand_total += 10
      else
        @hand_total += @user.hand[i].rank
      end
      puts "#{@user.hand[i].rank} #{@user.hand[i].suit.upcase}"
    end
  end
end
