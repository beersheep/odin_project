require 'pry' 
require 'benchmark'

class Array 
  def bubble_sort
    final_arr = []

    while self.any? do 
      self.each_with_index do |n, i|
        unless self[i + 1].nil?
          if block_given? 
            comparison = yield(n, self[i + 1])
          else 
            comparison = (n <=> self[i + 1])
          end
            
          if comparison >= 1 
            self[i], self[i + 1] = self[i + 1], self[i]
          end
        end
      end

      final_arr.unshift(self.pop)
    end
    
    final_arr
  end

  alias_method :bubble_sort_by, :bubble_sort
end



