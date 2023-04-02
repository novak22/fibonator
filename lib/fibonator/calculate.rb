# frozen_string_literal: true

require_relative 'calculators/recursive_calculator'
require_relative 'calculators/matrix_calculator'
require_relative 'calculators/dijkstra/calculator'

module Fibonator
  class Calculate
    attr_accessor :calculator

    DEFAULT_CALCULATOR = :dijkstra

    def initialize(calculator = DEFAULT_CALCULATOR)
      @calculator = calculator_class_from_symbol(calculator)
      raise ArgumentError, 'Invalid calculator' unless @calculator
    end

    def nth_element(nth)
      @calculator.call(nth)
    end

    def soft_limit
      @calculator.class::SOFT_LIMIT
    end

    private

    def calculator_class_from_symbol(calculator_symbol)
      case calculator_symbol
      when :matrix
        Calculators::MatrixCalculator.new
      when :recursive
        Calculators::RecursiveCalculator.new
      when :dijkstra
        Calculators::Dijkstra::Calculator.new
      else
        false
      end
    end
  end
end
