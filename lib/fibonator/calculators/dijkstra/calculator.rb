module Calculators
  module Dijkstra
    class Calculator
      require_relative 'decomposer'
      DEFAULT_DECOMPOSER = Decomposer
      INITIAL_FIBS = { 0 => 0, 1 => 1, 2 => 1, 3 => 2 }.freeze
      SOFT_LIMIT = 100_000_000

      def initialize(decomposer = DEFAULT_DECOMPOSER)
        @fibs = INITIAL_FIBS.dup
        @decomposer = decomposer.new
      end

      def call(n)
        final_element_sign = sign(n)
        n = n.abs

        return @fibs[n] * final_element_sign if @fibs.key?(n)

        components = @decomposer.call(n)

        components.reverse_each do |e|
          next if @fibs[e]

          @fibs[e] = calculate_fibonacci(e)
        end

        @fibs[n] * final_element_sign
      end

      private

      def sign(n)
        n.negative? && n.even? ? -1 : 1
      end

      def calculate_fibonacci(n)
        if n.even?
          even_fibonacci(n)
        else
          odd_fibonacci(n)
        end
      end

      def odd_fibonacci(n)
        c = (n + 1) / 2
        @fibs[c - 1] * @fibs[c - 1] + @fibs[c] * @fibs[c]
      end

      def even_fibonacci(n)
        c = n / 2
        (2 * @fibs[c - 1] + @fibs[c]) * @fibs[c]
      end
    end
  end
end
