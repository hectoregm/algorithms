# Summary: Algorithm to sort an array of numbers
# Input: An array of n numbers
# Ouput: A sorted array of n numbers
# Complexity: O(n * log n)
# Wiki: http://en.wikipedia.org/wiki/Merge_sort
# Cormen: page 31 (hardcover), 52 (pdf)

def mergesort(sequence, left = 0, right = sequence.size-1)
  if left < right
    mid = ((left + right) / 2.0).floor
    mergesort(sequence, left, mid)
    mergesort(sequence, mid + 1, right)
    merge(sequence, left, mid, right)
  end
end

def merge(sequence, left, mid, right)
  subarray_left = sequence[left..mid]
  subarray_right = sequence[(mid + 1)..right]

  subarray_left.push Float::INFINITY
  subarray_right.push Float::INFINITY

  i = j = 0
  left.upto(right) do |index|
    if subarray_left[i] <= subarray_right[j]
      sequence[index] = subarray_left[i]
      i += 1
    else
      sequence[index] = subarray_right[j]
      j += 1
    end
  end

  sequence
end

array_1 = [4,11,13,3,9,12]
array_2 = [2,4,5,7,1,2,3,6]
array_3 = (0..1000).to_a

puts mergesort(array_1) == array_1.sort ? "mergesort([4,11,13,3,9,12]) is correct" : "mergesort([4,11,13,3,9,12]) is incorrect"
puts mergesort(array_2) == array_2.sort ? "mergesort([2,4,5,7,1,2,3,6]) is correct" : "mergesort([2,4,5,7,1,2,3,6]) is incorrect"
puts mergesort(array_3.shuffle) == array_3 ? "mergesort(array.shuffle) is correct" : "mergesort(array.shuffle) is incorrect"
