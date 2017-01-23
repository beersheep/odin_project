class Array 
  def bubble_sort
    this = self.clone
    should_swap = true

    while should_swap do 
      should_swap = false
      this.each_with_index do |n, i|
        unless this[i + 1].nil?
          comparison = block_given? ? yield(n, this[i + 1]) : (n <=> this[i+1])
          if comparison >= 1 
            this[i], this[i + 1] = this[i + 1], this[i]
            should_swap = true
          end
        end
      end
    end

    this
  end

  alias_method :bubble_sort_by, :bubble_sort
end
