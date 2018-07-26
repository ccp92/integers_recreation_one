# frozen_string_literal: true

class RecreationOne
  def list_squared(m, n)
    factors_squared = array_of_factors(m).map! {|factor| factor ** 2}
    sum_of_squares = factors_squared.reduce(:+)
    return [m, sum_of_squares] if integer?(Math.sqrt(sum_of_squares))
    nil
  end

  private

  def array_of_factors(m)
    (1..m).select { |n| m % n == 0 }
  end

  def integer?(num)
    num % 1 == 0
  end
end
