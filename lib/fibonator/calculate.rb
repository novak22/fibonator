require_relative 'calculators/recursive_calculator'
require_relative 'calculators/matrix_calculator'

module Fibonator
  class Calculate
    def self.nth_element(nth, calculator: :matrix)
      calculator = calculator_class_from_symbol(calculator)
      raise ArgumentError, "Invalid calculator" unless calculator

      calculator.call(nth)
    end

    private

    def self.calculator_class_from_symbol(calculator_symbol)
      case calculator_symbol
      when :matrix
        Calculators::MatrixCalculator.new
      when :recursive
        Calculators::RecursiveCalculator.new
      else
        false
      end
    end
  end
end