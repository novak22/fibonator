# frozen_string_literal: true

module Fibonator
  module Calculators
    module Recursive
      class Calculator
        SOFT_LIMIT = 10_000

        def initialize
          @memo = { 0 => 0, 1 => 1, 2 => 1 }
        end

        def call(nth)
          compute(nth)
        end

        def soft_limit
          SOFT_LIMIT
        end

        private

        attr_reader :memo

        def compute(nth)
          return memo[nth] if memo.key?(nth)

          memo[nth] = compute(nth - 1) + compute(nth - 2)
        end
      end
    end
  end
end
