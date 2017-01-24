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
end
