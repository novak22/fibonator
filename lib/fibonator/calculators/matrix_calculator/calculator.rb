# frozen_string_literal: true

require 'matrix'

module Fibonator
  module Calculators
    module MatrixCalculator
      class Calculator
        SOFT_LIMIT = 10_000_000

        def call(nth)
          calculate_nth_matrix(nth)
        end

        private

        def calculate_nth_matrix(nth)
          negative = nth.negative?
          abs_nth = nth.abs

          result = (Matrix[[1, 1], [1, 0]]**abs_nth)[1, 0]

          return result unless negative

          abs_nth.even? ? -result : result
        end
      end
    end
  end
end
