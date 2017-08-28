require "minitest/autorun"
require_relative "../lib/dealer"
require_relative "../lib/deck"

class DealerTest < MiniTest::Test
  i_suck_and_my_tests_are_order_dependent!
  def test_dealer_draw
    deck = Deck.new
    dealer = Dealer.new
    2.times{ dealer.hand<<deck.draw}
    sample_hand = [Card.new(:A, :clubs), Card.new(2, :clubs)]
    assert_equal sample_hand, dealer.hand
  end
end
