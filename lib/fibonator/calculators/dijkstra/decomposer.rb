module Calculators
  module Dijkstra
    # Decomposes a positive integer into a list of unique components that can be used to calculate its corresponding Fibonacci number.
    # Components are calculated using the iterative algorithm proposed by Dijkstra.
    # Returns an array of components in descending order, where the first component is equal to the input integer.
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
