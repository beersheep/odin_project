require 'minitest/autorun'
require 'minitest/pride'
require_relative 'bubble_sort.rb'

class TestBubbleSort < Minitest::Test

  def test_it_has_bubble_sort_method
    assert_equal(true, Array.new.respond_to?(:bubble_sort))
  end

  def test_bubble_sort_1
    array = [4, 2, 1, 3, 5]
    assert_equal([1, 2, 3, 4, 5], array.bubble_sort)
  end

  def test_bubble_sort_2
    array = [6, 1, 8, 6, 2, 7, 4, 9]
    assert_equal([1, 2, 4, 6, 6, 7, 8, 9], array.bubble_sort)
  end

  def test_bubble_sort_3
    array = (1..100).to_a.shuffle
    assert_equal((1..100).to_a, array.bubble_sort)
  end
end

