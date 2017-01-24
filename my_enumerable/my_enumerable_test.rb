require "minitest/autorun"
require "minitest/reporters"
require_relative "./my_enumerable"

Minitest::Reporters.use!

class TestMyEnumerable < MiniTest::Test
  def test_enumerable_respond_to_my_each 
    assert_respond_to(Array.new, :my_each)
  end

  def test_my_each 
    array = [1, 2, 3] 
    new_array = []

    array.my_each { |n| new_array << n + 1 }
    assert_equal([2, 3, 4], new_array)
  end
end
