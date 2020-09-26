module Calculators
  class RecursiveCalculator
    attr_accessor :nth_array

    SOFT_LIMIT = 10_000

    def initialize
      @nth_array = {0 => 0, 1 => 1, 2 => 1}
    end


    def call(nth)
      return @nth_array[nth] if @nth_array.has_key?(nth)

      return calculate_nth_naive(nth)
    end

    private
    def calculate_nth_naive(nth)
      return @nth_array[nth] if @nth_array.has_key?(nth)

      el = calculate_nth_naive(nth - 1) + calculate_nth_naive(nth - 2)

      @nth_array[nth] = el
    end

  end
end