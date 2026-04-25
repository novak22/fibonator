# frozen_string_literal: true

module Fibonator
  module Calculators
    module Dijkstra
      # Decomposes a positive integer into components needed to compute its Fibonacci number.
      # Uses the iterative algorithm proposed by Dijkstra.
      # Returns an array in descending order, starting with the input integer.
      # Example: Decomposer.new.call(123) #=> [123, 62, 61, 31, 30, 16, 15, 14, 8, 7, 6, 4, 3, 2, 1, 0]
      class Decomposer
        def call(number)
          arr = [number]
          new_components = calculate_components(number)

          until new_components[-2, 2] == [1, 0]
            arr << new_components
            new_components = calculate_components_for_multiple(new_components)
          end

          arr << [1, 0]
          arr.flatten
        end

        private

        def calculate_components_for_multiple(numbers)
          numbers.map { |e| calculate_components(e) }.flatten.uniq.sort.reverse
        end

        def calculate_components(number)
          number += 1 if number.odd?
          number /= 2

          [number, number - 1]
        end
      end
    end
  end
end
