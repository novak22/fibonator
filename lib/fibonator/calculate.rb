# frozen_string_literal: true

require_relative 'calculators/recursive/calculator'
require_relative 'calculators/matrix_calculator/calculator'
require_relative 'calculators/dijkstra/calculator'

module Fibonator
  class Calculate
    attr_reader :calculator

    def initialize(calculator)
      @calculator = calculator_class_from_symbol(calculator)
      return if @calculator

      raise ArgumentError, "Invalid calculator: #{calculator}. Valid options: :dijkstra, :matrix, :recursive"
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
        Fibonator::Calculators::MatrixCalculator::Calculator.new
      when :recursive
        Fibonator::Calculators::Recursive::Calculator.new
      when :dijkstra
        Fibonator::Calculators::Dijkstra::Calculator.new
      end
    end
  end
end
