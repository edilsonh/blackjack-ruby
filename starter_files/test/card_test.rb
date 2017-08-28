require "minitest/autorun"
require_relative "../lib/card"

class CardTest < MiniTest::Test
  i_suck_and_my_tests_are_order_dependent!
  def test_that_card_has_a_suit
    card = Card.new(:A, :spades)
    assert_equal card.suit, :spades
  end

  def test_that_card_has_a_rank
    card = Card.new(:A, :spades)
    assert_equal card.rank, :A
  end

  def test_that_ace_is_low
    ace = Card.new(:A, :spades)
    two = Card.new(2, :hearts)

    assert two.greater_than?(ace)
    refute ace.greater_than?(two)
  end

  def test_face_card_ranks
    ten = Card.new(10, :hearts)
    jack = Card.new(:J, :spades)
    queen = Card.new(:Q, :diamonds)
    king = Card.new(:K, :clubs)

    assert king.greater_than?(queen)
    assert queen.greater_than?(jack)
    assert jack.greater_than?(ten)
  end
end
