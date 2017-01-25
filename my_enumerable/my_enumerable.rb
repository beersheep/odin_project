require 'pry'

module Enumerable
  def my_each
    i = 0
    while i < self.length 
      yield self[i]
      i += 1
    end

    self
  end

  def my_each_with_index
    i = 0 
    while i < self.length
      yield self[i], i
      i += 1
    end

    self 
  end

  def my_select 
    new_arr = []
    self.my_each { |el|  new_arr.push(el) if yield(el) == true }

    new_arr
  end

  def my_all? 
    self.my_each do |el|
      return false unless yield(el) 
    end

    return true
  end

  def my_any?
    self.my_each do |el|
      return true if yield(el)
    end
    
    return false 
  end

  def my_none?
    self.my_each do |el|
      return false if yield(el)
    end

    return true
  end

  def my_count
    counter = 0
    self.my_each do |el|
      counter += 1 if yield(el) == true
    end
    counter
  end

  def my_map(&block)
    new_arr = []
    self.my_each do |el|
      if block 
        new_arr << block.call(el)
      else
        new_arr << yield(el)
      end
    end

    new_arr
  end

  def my_inject
    accumulator = self.first
    self.my_each_with_index do |el, i|
      accumulator = yield(accumulator, el) unless i == 0 
    end

    accumulator
  end

  def multiply_els
    result = self.my_inject { |sum, el| sum * el }
  end
end
