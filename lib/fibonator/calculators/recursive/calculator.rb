# frozen_string_literal: true

module Calculators
  module Recursive
    class Calculator
      attr_reader :nth_array

      SOFT_LIMIT = 10_000

      def initialize
        @nth_array = { 0 => 0, 1 => 1, 2 => 1 }
      end

      def call(nth)
        calculate_nth_naive(nth)
      end

      private

      def calculate_nth_naive(nth)
        return @nth_array[nth] if @nth_array.key?(nth)

        el = calculate_nth_naive(nth - 1) + calculate_nth_naive(nth - 2)

        @nth_array[nth] = el
      end
    end
  end
end
