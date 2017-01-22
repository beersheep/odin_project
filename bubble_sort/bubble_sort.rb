require 'pry' 
require 'benchmark'

class Array 
  def bubble_sort
    final_arr = []

    while self.any? do 
      self.each_with_index do |n, i|
        if (n <=> self[i + 1]) == 1 
          self[i], self[i + 1] = self[i + 1], self[i]
        end
      end

      final_arr.unshift(self.pop)
    end
    
    final_arr
  end
end



