# Summary: Algorithm to multiply two numbers
# Input: Two numbers x and y
# Ouput: The result of the product of x and y
# Complexity: O(n**(lg3))
# Wiki: http://en.wikipedia.org/wiki/Karatsuba_algorithm
# Notes: Insight is x * y = (a * B^m + b)(c * B^m + d)
# with m less than the number of digits on x and y and B any base.
# Using B = 10

def karatsuba(number_x, number_y)
  # Get the count of digits of the lesser number
  if number_x > number_y
    count = count_digits(number_y)
  else
    count = count_digits(number_x)
  end

  # Base case
  return number_x * number_y if count == 1

  # m only has to be less than the count of digits
  # but algorithm is most efficient when is half of count
  m = (count / 2)
  base = 10 ** m

  a = number_x / base
  b = number_x % base
  c = number_y / base
  d = number_y % base

  # Recurse to get partial products
  ac = karatsuba(a, c)
  bd = karatsuba(b, d)
  product_of_sums = karatsuba(a + b, c + d)
  ad_plus_bc = product_of_sums - ac - bd

  (base ** 2)*ac + (base * ad_plus_bc) + bd
end

def count_digits(number, base = 10)
  count = 1
  while (number % base) != number do
    base *= 10
    count += 1
  end

  count
end

puts karatsuba(5678, 1234) == 7006652 ? "karatsuba(5678, 1234) is correct" : "karatsuba(5678, 1234) is incorrect"
puts karatsuba(12345, 6789) == 83810205 ? "karatsuba(12345, 6789) is correct" : "karatsuba(12345, 6789) is incorrect"
puts karatsuba(1231238223492489023423094, 11238478120317401283) == 13837243835618804465895766178601187087429602 ? "karatsuba(1231238223492489023423094, 11238478120317401283) is correct" : "karatsuba(1231238223492489023423094, 11238478120317401283) is incorrect"
