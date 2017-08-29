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

  def current_hand(player)
    @hand_total = 0
    hand_iteration = player.hand.length - 1

    for i in 0..hand_iteration
      if (player.hand[i].rank == :K) || (player.hand[i].rank == :Q) || (player.hand[i].rank == :J)
        @hand_total += 10
      elsif player.hand[i].rank == :A
        if @hand_total > 10
          @hand_total += 1
        else
          @hand_total += 11
        end
      else
        @hand_total += player.hand[i].rank
      end
      puts "#{player.hand[i].rank} #{player.hand[i].suit.upcase}"
    end
  end
end
