# frozen_string_literal: true

require_relative 'calculators/recursive/calculator'
require_relative 'calculators/matrix_calculator/calculator'
require_relative 'calculators/dijkstra/calculator'

module Fibonator
  class Calculate
    private attr_reader :calculator

    def initialize(calculator)
      @calculator = calculator_class_from_symbol(calculator)
      return if @calculator

      raise ArgumentError, "Invalid calculator: #{calculator}. Valid options: :dijkstra, :matrix, :recursive"
    end

    def nth_element(nth)
      @calculator.call(nth)
    end

    def soft_limit
      @calculator.soft_limit
    end

    private

    def calculator_class_from_symbol(calculator_symbol)
      case calculator_symbol
      when :dijkstra  then Calculators::Dijkstra::Calculator.new
      when :matrix    then Calculators::MatrixCalculator::Calculator.new
      when :recursive then Calculators::Recursive::Calculator.new
      end
    end
  end
end
