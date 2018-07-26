# frozen_string_literal: true

class RecreationOne
  def list_squared(first_number, last_number)
    validation(first_number, last_number)
    results = []
    (first_number..last_number).each { |number| build_results(results, number) }
    return results unless results.empty?
    []
  end

  private

  def validation(first_number, last_number)
    raise ArgumentError if first_number > last_number
    raise ArgumentError if 1 > first_number
    raise ArgumentError unless (first_number.is_a? Integer) && (last_number.is_a? Integer)
  end

  def build_results(results, number)
    factors_squared = factors(number).map! { |factor| factor**2 }
    sum_of_squares = factors_squared.reduce(:+)
    results.push([number, sum_of_squares]) if integer?(Math.sqrt(sum_of_squares))
  end

  def factors(first_number)
    (1..first_number).select { |integer| (first_number % integer).zero? }
  end

  def integer?(num)
    (num % 1).zero?
  end
end
