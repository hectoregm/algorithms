# Summary: Algorithm to find the contigous subarray in an array of
# numbers with the largest sum
# Input: An array of numbers
# Ouput: An array with the begin index, end intex and sum of the
# subarray with the largest sum
# Complexity: O(n**2)
# Wiki: http://en.wikipedia.org/wiki/Maximum_subarray_problem
# Cormen: page 70 (hardcover), 91 (pdf)


# Complexity of this is O(n)
def find_max_crossing_subarray(array, low, mid, high)
  left_sum = -Float::INFINITY
  max_left = max_right = 0
  sum = 0
  mid.downto(low) do |index|
    sum += array[index]
    if sum > left_sum
      left_sum = sum
      max_left = index
    end
  end

  right_sum = -Float::INFINITY
  sum = 0
  (mid+1).upto(high) do |index|
    sum += array[index]
    if sum > right_sum
      right_sum = sum
      max_right = index
    end
  end

  [max_left, max_right, left_sum + right_sum]
end

def find_maximum_subarray(array, low, high)
  return [low, high, array[low]] if high == low

  mid = ((low + high) / 2.0).floor
  left_low, left_high, left_sum = find_maximum_subarray(array,
                                                        low,
                                                        mid)
  right_low, right_high, right_sum = find_maximum_subarray(array,
                                                           mid + 1,
                                                           high)
  cross_low, cross_high, cross_sum = find_max_crossing_subarray(array,
                                                                low,
                                                                mid,
                                                                high)

  if left_sum >= right_sum && left_sum >= cross_sum
    result = [left_low, left_high, left_sum]
  elsif right_sum >= left_sum && right_sum >= cross_sum
    result = [right_low, right_high, right_sum]
  else
    result = [cross_low, cross_high, cross_sum]
  end

  result
end

array = [13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7]
puts find_maximum_subarray(array, 0, 15).inspect
