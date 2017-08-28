require "minitest/autorun"
require_relative "../lib/game"

class GameTest < MiniTest::Test
  i_suck_and_my_tests_are_order_dependent!
  def setup
    @game = Game.new
    @game.shuffle_deck
    @ace_clubs = Card.new(:A, :clubs)
  end

  def test_user_is_drawing
    2.times{@game.user_draw}

    refute_equal @game.user.hand, @ace_clubs
  end

  def test_dealer_is_drawing
    @game.dealer_draw

    refute_equal @game.dealer.hand, @ace_clubs
  end

end
