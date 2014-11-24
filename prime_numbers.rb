

=begin
Psudocode from http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

Input: an integer n > 1
 
Let A be an array of Boolean values, indexed by integers 2 to n,
initially all set to true.
 
 for i = 2, 3, 4, ..., not exceeding Ãn:
  if A[i] is true:
    for j = i2, i2+i, i2+2i, ..., not exceeding Ãn:
      A[j] := false
 
Output: all i such that A[i] is true.
=end

def prime_numbers(limit=1000000)
  yield 2

  sub_limit = (limit**0.5).to_i
  a = [false,false] + Array.new(limit-2, true)
  
  # only go throuh odd numbers
  (3..limit).step(2).each {|i|
    if a[i]
      yield i
      if i <= sub_limit

        # can be optimized by replacing 2*i with i*i
        (i*i..sub_limit).step(i).each {|j|
        #(2*i..sub_limit).step(i).each {|j|
          a[j] = false
        }
      end  
    end
  }
end


def print_first_x_prime_numbers(n)
  # upper bound of Nth prime number is n(ln(n) + ln(ln(n)))
  # http://en.wikipedia.org/wiki/Prime_number_theorem#Approximations_for_the_nth_prime_number
  top_boundary = n*(Math.log(n) + Math.log(Math.log(n))).to_i
  
  #puts "top_boundary: #{top_boundary}"
  
  prime_numbers(top_boundary){|i|puts "#{i}"}

end

if __FILE__ == $0
  print_first_x_prime_numbers(10)
end
