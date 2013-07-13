# Summary: Algorithm to sort an array of numbers
# Input: An array of n numbers
# Ouput: A sorted array of n numbers
# Complexity: O(n*log n)
# Wiki: http://en.wikipedia.org/wiki/Merge_sort
# Cormen: page 31 (hardcover), 52 (pdf)

def merge_sort(sequence, left, right)
  if left < right
    mid = ((left + right) / 2.0).floor
    merge_sort(sequence, left, mid)
    merge_sort(sequence, mid + 1, right)
    merge(sequence, left, mid, right)
  end
end

def merge(sequence, left, mid, right)
  subarray_left = sequence[left..mid]
  subarray_right = sequence[(mid + 1)..right]
  length = subarray_left.length + subarray_right.length

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
array_0 = (0..1000).to_a
array_1 = [4,11,13,3,9,12]
array_2 = [2,4,5,7,1,2,3,6]

puts merge_sort([4,11,13,3,9,12], 0, 5) == array_1 ? "merge_sort([4,11,13,3,9,12], 0 , 5) is correct" : "insertion_sort([4,11,13,3,9,12], 0, 5) is incorrect"
puts merge_sort([2,4,5,7,1,2,3,6], 0, 7) == array_1 ? "merge_sort([2,4,5,7,1,2,3,6]) is correct" : "insertion_sort([2,4,5,7,1,2,3,6], 0, 7) is incorrect"
puts merge_sort(array_0.shuffle, 0, array_0.size - 1) == array_0 ? "merge_sort(array.shuffle, 0 , #{array_0.size - 1}) is correct" : "insertion_sort(array.shuffle, 0, #{array_0.size - 1}) is incorrect"
