require_relative 'calculators/recursive_calculator'

module Fibonator
  class Calculate
    def self.nth_element nth
      Calculators::RecursiveCalculator.new.call(nth)
    end
  end
end