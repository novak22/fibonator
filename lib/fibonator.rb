# frozen_string_literal: true

require 'fibonator/version'
require 'fibonator/calculate'

# Fibonator calculates the nth element of the Fibonacci sequence using three
# algorithms: memoized recursion, matrix exponentiation, and Dijkstra's method.
# The Dijkstra calculator is the default and supports negative indices.
module Fibonator
  extend self

  DEFAULT_CALCULATOR = :dijkstra

  # Returns the nth element of the Fibonacci sequence.
  #
  # @param nth [Integer, String] the index (supports negative indices for :dijkstra and :matrix)
  # @param calculator [Symbol] the algorithm to use (:dijkstra, :matrix, :recursive)
  # @param soft_limit [Integer, nil] override the calculator's default upper bound; 0 disables the limit
  # @param log_time [Boolean] when true, prints elapsed time to stdout
  # @return [Integer] the nth Fibonacci number
  # @raise [ArgumentError] if nth is not a valid integer, exceeds the soft limit, or is negative for :recursive
  def nth_element(nth, soft_limit: nil, calculator: DEFAULT_CALCULATOR, log_time: false)
    raise ArgumentError, 'Only numbers are allowed' unless valid_argument?(nth)

    nth = Integer(nth) if nth.is_a?(String)
    calc = Calculate.new(calculator)
    soft_limit ||= calc.soft_limit

    raise ArgumentError, "Number too big. Limit set to: #{soft_limit}" if out_of_limit?(nth, soft_limit)
    raise ArgumentError, ':recursive does not support negative indices' if nth.negative? && calculator == :recursive

    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    result = calc.nth_element(nth)
    elapsed = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time

    puts format('total time: %.6f seconds', elapsed) if log_time

    result
  end

  # Returns the soft limit for the given calculator.
  #
  # @param calculator [Symbol] the algorithm (:dijkstra, :matrix, :recursive)
  # @return [Integer] the upper bound on nth before an ArgumentError is raised
  def soft_limit(calculator = DEFAULT_CALCULATOR)
    Calculate.new(calculator).soft_limit
  end

  private

  def valid_argument?(arg)
    return true if arg.is_a?(Integer)
    return false unless arg.is_a?(String)

    arg == arg.to_i.to_s
  end

  def out_of_limit?(nth, limit)
    limit.positive? && nth > limit
  end
end
