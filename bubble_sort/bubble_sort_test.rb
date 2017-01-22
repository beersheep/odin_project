require 'minitest/autorun'
require 'minitest/pride'
require_relative 'bubble_sort.rb'

class TestBubbleSort < Minitest::Test

  def test_it_has_bubble_sort_method
    assert_respond_to(Array.new, :bubble_sort)
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

  def test_it_has_bubble_sort_by_method
    assert_respond_to(Array.new, :bubble_sort_by)
  end

  def test_bubble_sort_by_1
    array = ["hi","hello","hey"]
    result = array.bubble_sort_by do |left, right|
      left.length - right.length
    end

    expected = ["hi", "hey", "hello"]

    assert_equal(expected, result)
  end

  def test_bubble_sort_by_2
    array = ["roy", "cookie", "kyle", "vicente"]
    result = array.bubble_sort_by do |left, right|
      left.slice(0) <=> right.slice(0)
    end

    expected = ["cookie", "kyle", "roy", "vicente"]

    assert_equal(expected, result)
  end

  def test_bubble_sort_by_3
    array = [
      { item: "trousers", price: 450 }, 
      { item: "blazer", price: 1200 }, 
      { item: "shirt", price: 300 }, 
      { item: "jeans", price: 120 }
    ]

    result = array.bubble_sort_by do |left, right|
      right[:price] - left[:price]
    end

    expected = [
      { item: "blazer", price: 1200 }, 
      { item: "trousers", price: 450 }, 
      { item: "shirt", price: 300 }, 
      { item: "jeans", price: 120 }
    ]

    assert_equal(expected, result)
  end
end

