# frozen_string_literal: true

require 'matrix'

module Fibonator
  module Calculators
    module MatrixCalculator
      class Calculator
        SOFT_LIMIT = 10_000_000

        # Q-matrix: [[1,1],[1,0]]^n gives F(n+1) at [0,0] and F(n) at [1,0].
        Q_MATRIX = Matrix[[1, 1], [1, 0]].freeze

        def call(nth)
          compute(nth)
        end

        def soft_limit
          SOFT_LIMIT
        end

        private

        def compute(nth)
          abs_nth = nth.abs

          result = (Q_MATRIX**abs_nth)[1, 0]

          # Negafibonacci: F(-n) = (-1)^(n+1) * F(n)
          return result unless nth.negative?

          abs_nth.even? ? -result : result
        end
      end
    end
  end
end
