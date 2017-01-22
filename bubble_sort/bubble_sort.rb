class Array 
  def bubble_sort
    this = self.clone
    final_arr = []

    while this.any? do 
      this.each_with_index do |n, i|
        unless this[i + 1].nil?
          comparison = block_given? ? yield(n, this[i + 1]) : (n <=> this[i+1])
          this[i], this[i + 1] = this[i + 1], this[i] if comparison >= 1 
        end
      end

      final_arr.unshift(this.pop)
    end

    final_arr
  end

  alias_method :bubble_sort_by, :bubble_sort
end
