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

  def test_enumerator_respond_to_my_all
    assert_respond_to(Array.new, :my_all?)
  end

  def test_my_all
    result = [1, 3, 5].my_all?(&:odd?)
    assert_equal(true, result)
  end

  def test_my_all_2
    result = [1, 4, 5].my_all?(&:odd?)
    assert_equal(false, result)
  end

  def test_enumerator_respond_to_my_any?
    assert_respond_to(Array.new, :my_any?)
  end

  def test_my_any?
    result = [1, 4, 5].my_any?(&:even?)
    assert_equal(true, result)
  end

  def test_my_any_2
    result = [1, 3, 5].my_any?(&:even?)
    assert_equal(false, result)
  end

  def test_enumerator_respond_to_my_none?
    assert_respond_to(Array.new, :my_none?)
  end

  def tesy_my_none
    result = [1, 3, 5].my_none?(&:even?)
    assert_equal(true, result)
  end

  def test_my_none_2
    result = [1, 4, 5].my_none?(&:even?)
    assert_equal(false, result)
  end

  def test_enumerator_respond_to_my_count
    assert_respond_to(Array.new, :my_count)
  end

  def test_my_count
    result = [1, 4, 5].my_count(&:even?)
    assert_equal(1, result)
  end

  def test_my_count_2
    result = [1, 3, 4, 5, 6, 7].my_count(&:odd?)
    assert_equal(4, result)
  end

  def test_enumerator_respond_to_my_map
    assert_respond_to(Array.new, :my_map)
  end

  def test_my_map
    result = [1, 2, 3].my_map { |n| n += 1 }
    assert_equal([2, 3, 4], result)
  end

  def test_enumerator_respond_to_my_inject
    assert_respond_to(Array.new, :my_inject)
  end

  def test_my_inject 
    result = (5..10).to_a.my_inject { |sum, n| sum + n }
    assert_equal(45, result)
  end

  def test_multiply_els
    result = [2, 4, 5].multiply_els
    assert_equal(40, result)
  end

  def test_map_can_accept_a_proc
    block = Proc.new { |n| n + 1 }
    result = [1, 2, 3].my_map(&block)
    assert_equal([2, 3, 4], result)
  end

end
