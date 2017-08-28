require "minitest/autorun"
require_relative "../lib/deck"

class DeckTest < MiniTest::Test
  def setup
    @deck = Deck.new
  end

  def test_new_deck_has_52_cards
    assert_equal @deck.cards_left, 52
  end

  def test_new_deck_is_in_order
    card = @deck.draw
    assert_equal card, Card.new(:A, :clubs)

    card = @deck.draw
    assert_equal card, Card.new(2, :clubs)

    11.times { @deck.draw }
    card = @deck.draw
    assert_equal card, Card.new(:A, :diamonds)

    12.times { @deck.draw }

    card = @deck.draw
    assert_equal card, Card.new(:A, :hearts)

    12.times{ @deck.draw }

    card = @deck.draw
    assert_equal card, Card.new(:A, :spades)
  end

  def test_deck_knows_how_many_are_left
    assert_equal @deck.cards_left, 52

    30.times { @deck.draw }

    assert_equal @deck.cards_left, 22
  end

  def test_empty_deck_return_nil_on_draw
      52.times { @deck.draw }

      assert_nil @deck.draw
  end

  def test_deck_can_be_shuffled
    shuffled_deck = @deck.shuffle
    refute_equal @deck, shuffled_deck
  end
end
