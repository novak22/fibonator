require "fibonator/version"
require "fibonator/calculate"

module Fibonator
  extend self

  DEFAULT_CALCULATOR = :matrix

  def nth_element(nth, soft_limit: nil, calculator: DEFAULT_CALCULATOR)
    raise ArgumentError, 'Only numbers are allowed' unless valid_argument?(nth)

    nth = nth.to_i if nth.is_a?(String)
    calculator = Fibonator::Calculate.new(calculator)
    soft_limit = calculator.soft_limit if soft_limit.nil?

    raise ArgumentError, "Number too big. Limit set to: #{soft_limit}" if out_of_limit?(nth, soft_limit)

    calculator.nth_element(nth)
  end

  def soft_limit calculator = DEFAULT_CALCULATOR
    calculator = Fibonator::Calculate.new(calculator)
    calculator.soft_limit
  end

  private

  def valid_argument?(arg)
    arg.is_a?(Integer) || (arg == arg.to_i.to_s rescue false)
  end

  def out_of_limit?(arg, limit)
    limit.positive? && arg > limit
  end

end
