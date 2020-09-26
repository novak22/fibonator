require "fibonator/version"
require "fibonator/calculate"

module Fibonator
  extend self

  SOFT_LIMIT = 10000000

  def nth_element(nth, soft_limit: SOFT_LIMIT, calculator: :matrix)
    raise ArgumentError, 'Only numbers are allowed' unless valid_argument?(nth)

    nth = nth.to_i if nth.is_a?(String)
    raise ArgumentError, "Number too big. Limit set to: #{soft_limit}" if out_of_limit?(nth, soft_limit)

    calculator = Fibonator::Calculate.new(calculator)

    calculator.nth_element(nth)
  end

  private

  def valid_argument?(arg)
    arg.is_a?(Integer) || (arg == arg.to_i.to_s rescue false)
  end

  def out_of_limit?(arg, limit)
    limit.positive? && arg > limit
  end

end
