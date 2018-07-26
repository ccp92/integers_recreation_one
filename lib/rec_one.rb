# frozen_string_literal: true

class RecreationOne
  def list_squared(m, n)
    results = []
    (m..n).each { |number| build_results(results, number) }
    return results unless results.empty?
    nil
  end

  private

  def build_results(results, number)
    factors_squared = array_of_factors(number).map! { |factor| factor**2 }
    sum_of_squares = factors_squared.reduce(:+)
    results.push([number, sum_of_squares]) if integer?(Math.sqrt(sum_of_squares))
  end

  def array_of_factors(m)
    (1..m).select { |n| (m % n).zero? }
  end

  def integer?(num)
    (num % 1).zero?
  end
end
