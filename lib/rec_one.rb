# frozen_string_literal: true

require 'prime'

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
    sum_of_squares = factors(number).map! { |factor| factor**2 }.inject(:+)
    results.push([number, sum_of_squares]) if integer?(sum_of_squares**0.5)
  end

  def factors(number)
    factors = []
    (1..number**0.5).each do |possible_factor|
      if number % possible_factor == 0
        factors << possible_factor
        factors << number/possible_factor unless number/possible_factor == possible_factor
      end
    end
    factors
  end

  def integer?(num)
    (num % 1).zero?
  end
end
