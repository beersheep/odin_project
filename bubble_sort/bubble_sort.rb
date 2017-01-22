require 'pry' 
require 'benchmark'

class Sort 
  def bubble_sort(arr)
    final_arr = []

    while arr.any? do 
      arr.each_with_index do |n, i|
        if (n <=> arr[i + 1]) == 1 
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
        end
      end

      final_arr.unshift(arr.pop)
    end
    
    final_arr
  end
end



