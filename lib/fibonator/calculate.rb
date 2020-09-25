module Fibonator
  class Calculate
    @nth_array = {0 => 0, 1 => 1, 2 => 1}

    def self.nth_element nth
      calculate_nth_naive(nth)
    end

   private

  def self.calculate_nth_naive(nth)
    return @nth_array[nth] if @nth_array.has_key?(nth)

    el = calculate_nth_naive(nth - 1) + calculate_nth_naive(nth - 2)

    @nth_array[nth] = el
  end

  end
end