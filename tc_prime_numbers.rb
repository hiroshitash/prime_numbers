require_relative "prime_numbers"
require "test/unit"

class TestPrimeNumber < Test::Unit::TestCase
 
  def test_negative
    assert_equal(get_first_x_prime_numbers(-1), [] )
  end
  
  def test_zero
    assert_equal(get_first_x_prime_numbers(0), [] )
  end
 
  def test_first3
    assert_equal(get_first_x_prime_numbers(3), [2, 3, 5] )
  end
  
  def test_first5
    assert_equal(get_first_x_prime_numbers(5), [2, 3, 5, 7, 11] )
  end
  
  def test_first10
    assert_equal(get_first_x_prime_numbers(10), [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] )
  end
 
  def test_typecheck
    assert_raise( ArgumentError ) { get_first_x_prime_numbers('a') }
  end
 
end