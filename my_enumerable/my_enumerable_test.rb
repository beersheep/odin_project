require "minitest/autorun"
require "minitest/reporters"
require_relative "./my_enumerable"

Minitest::Reporters.use!

class TestMyEnumerable < MiniTest::Test
  def test_enumerator_respond_to_my_each 
    assert_respond_to(Array.new, :my_each)
  end

  def test_my_each 
    array = [1, 2, 3] 
    new_array = []

    array.my_each { |n| new_array << n + 1 }
    assert_equal([2, 3, 4], new_array)
  end

  def test_enumerator_respond_to_my_each_with_index
    assert_respond_to(Array.new, :my_each_with_index)
  end

  def test_my_each_with_index
    array = ["cookie", "roy", "lloyd"]
    new_hash = {}

    array.my_each_with_index { |name, i| new_hash[i + 1] = name }
    result = {
      1 => "cookie", 
      2 => "roy", 
      3 => "lloyd"
    }

    assert_equal(result, new_hash)
  end

  def test_enumerator_respond_to_my_select
    assert_respond_to(Array.new, :my_select)
  end

  def test_my_select
    result = (1..5).to_a.my_select(&:odd?)
    assert_equal(result, [1, 3, 5])
  end
end
