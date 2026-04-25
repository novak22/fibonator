# frozen_string_literal: true

require 'matrix'

module Calculators
  module MatrixCalculator
    class Calculator

      SOFT_LIMIT = 10_000_000

      def call(nth)
        calculate_nth_matrix(nth)
      end

      private

      def calculate_nth_matrix(nth)
        (Matrix[[1, 1], [1, 0]]**nth)[1, 0]
      end
    end
  end
end
