# frozen_string_literal: true

module Calculators
  module MatrixCalculator
    class Calculator
      require 'matrix'

      SOFT_LIMIT = 10_000_000

      def initialize; end

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
