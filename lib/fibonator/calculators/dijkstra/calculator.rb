# frozen_string_literal: true

module Calculators
  module Dijkstra
    class Calculator
      require_relative 'decomposer'
      DEFAULT_DECOMPOSER = Decomposer
      INITIAL_FIBS = { 0 => 0, 1 => 1, 2 => 1, 3 => 2 }.freeze
      SOFT_LIMIT = 100_000_000

      def initialize(decomposer = DEFAULT_DECOMPOSER)
        @fibonacci_map = INITIAL_FIBS.dup
        @decomposer = decomposer.new
      end

      def call(nth)
        final_element_sign = sign(nth)
        nth = nth.abs

        return @fibonacci_map[nth] * final_element_sign if @fibonacci_map.key?(nth)

        components = @decomposer.call(nth)

        components.reverse_each do |e|
          next if @fibonacci_map[e]

          @fibonacci_map[e] = calculate_fibonacci(e)
        end

        @fibonacci_map[nth] * final_element_sign
      end

      private

      def sign(nth)
        nth.negative? && nth.even? ? -1 : 1
      end

      def calculate_fibonacci(nth)
        if nth.even?
          fibonacci_for_evens(nth)
        else
          fibonacci_for_odd(nth)
        end
      end

      def fibonacci_for_odd(nth)
        index = (nth + 1) / 2

        @fibonacci_map[index - 1] * @fibonacci_map[index - 1] + @fibonacci_map[index] * @fibonacci_map[index]
      end

      def fibonacci_for_evens(nth)
        index = nth / 2

        (2 * @fibonacci_map[index - 1] + @fibonacci_map[index]) * @fibonacci_map[index]
      end
    end
  end
end
