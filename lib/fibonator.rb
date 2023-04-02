# frozen_string_literal: true

require 'fibonator/version'
require 'fibonator/calculate'

# This module provides a simple API for calculating the nth element of the Fibonacci sequence
# using different algorithms, including a recursive algorithm, a matrix-based algorithm, and the Dijkstra algorithm.
# The module also includes a soft limit value
# that can be used to prevent excessive recursion when calculating large values of `nth`.
module Fibonator
  extend self

  DEFAULT_CALCULATOR = :dijkstra

  def nth_element(nth, soft_limit: nil, calculator: DEFAULT_CALCULATOR)
    raise ArgumentError, 'Only numbers are allowed' unless valid_argument?(nth)

    nth = Integer(nth) if nth.is_a?(String)
    calculator = Fibonator::Calculate.new(calculator)
    soft_limit ||= calculator.soft_limit

    raise ArgumentError, "Number too big. Limit set to: #{soft_limit}" if out_of_limit?(nth, soft_limit)

    calculator.nth_element(nth)
  end

  def soft_limit(calculator = DEFAULT_CALCULATOR)
    calculator = Fibonator::Calculate.new(calculator)
    calculator.soft_limit
  end

  private

  def valid_argument?(arg)
    arg.is_a?(Integer) || begin
      arg == arg.to_i.to_s
    rescue StandardError
      false
    end
  end

  def out_of_limit?(arg, limit)
    limit.positive? && arg > limit
  end
end
