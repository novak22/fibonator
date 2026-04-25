# frozen_string_literal: true

require_relative 'decomposer'

module Fibonator
  module Calculators
    module Dijkstra
      class Calculator
        SOFT_LIMIT = 100_000_000
        SEED = { 0 => 0, 1 => 1, 2 => 1, 3 => 2 }.freeze

        def initialize(decomposer: Decomposer)
          @fibonacci_map = SEED.dup
          @decomposer = decomposer.new
        end

        def call(nth)
          sign = negafibonacci_sign(nth)
          abs_nth = nth.abs

          return @fibonacci_map[abs_nth] * sign if @fibonacci_map.key?(abs_nth)

          @decomposer.call(abs_nth).reverse_each do |n|
            next if @fibonacci_map.key?(n)

            @fibonacci_map[n] = fibonacci(n)
          end

          @fibonacci_map[abs_nth] * sign
        end

        def soft_limit
          SOFT_LIMIT
        end

        private

        # Negafibonacci sign: F(-n) = (-1)^(n+1) * F(n), so sign is -1 when n is negative and even.
        def negafibonacci_sign(nth)
          nth.negative? && nth.even? ? -1 : 1
        end

        def fibonacci(nth)
          nth.even? ? fibonacci_even(nth) : fibonacci_odd(nth)
        end

        # F(2k-1) = F(k)^2 + F(k-1)^2
        def fibonacci_odd(nth)
          k = (nth + 1) / 2
          (@fibonacci_map[k] * @fibonacci_map[k]) + (@fibonacci_map[k - 1] * @fibonacci_map[k - 1])
        end

        # F(2k) = F(k) * (2*F(k-1) + F(k))
        def fibonacci_even(nth)
          k = nth / 2
          @fibonacci_map[k] * ((2 * @fibonacci_map[k - 1]) + @fibonacci_map[k])
        end
      end
    end
  end
end
