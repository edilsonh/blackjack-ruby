require "minitest/autorun"
require_relative "../lib/user"
require_relative "../lib/deck"

class UserTest < MiniTest::Test
  i_suck_and_my_tests_are_order_dependent!
  def setup
    @deck = Deck.new
    @user = User.new
  end
  def test_that_user_has_100
    assert_equal 100, @user.money
  end

  def test_user_drawing_cards
    2.times{ @user.hand<<@deck.draw }
    sample_hand = [Card.new(:A, :clubs), Card.new(2, :clubs)]
    assert_equal sample_hand, @user.hand
  end

  def test_user_bet
    @user.bet

    assert_equal 90, @user.money
  end

  def test_user_win
    @user.win

    assert_equal 115, @user.money
  end
end
