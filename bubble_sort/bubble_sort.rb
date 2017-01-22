require 'pry' 

class Sort 
  def bubble_sort(arr)
    until sorted?(arr) do 
      arr.each_with_index do |n, i|
        if (n <=> arr[i + 1]) == 1 
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
        end
      end
    end
    arr
  end

  private 

  def sorted?(arr)
    arr.each_with_index do |n, i| 
      return true if arr[i].nil?

      return false if (n <=> arr[i + 1]) == 1
    end
  end
end
