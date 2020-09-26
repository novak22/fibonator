require_relative 'calculators/recursive_calculator'

module Fibonator
  class Calculate
    @nth_array = {0 => 0, 1 => 1, 2 => 1}

    def self.nth_element nth
      Calculators::RecursiveCalculator.new.call(nth)
    end
  end
end