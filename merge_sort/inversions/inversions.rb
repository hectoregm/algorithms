# Summary: Algorithm to sort an array of numbers and count inversions
# Input: An array of n numbers
# Ouput: A sorted array of n numbers and total number
# of inversions found
# Complexity: O(n * log n)
# Wiki: http://en.wikipedia.org/wiki/Merge_sort

def merge_sort(sequence, left, right)
  if left < right
    mid = ((left + right) / 2.0).floor
    inversions_left = merge_sort(sequence, left, mid)[1]
    inversions_right = merge_sort(sequence, mid + 1, right)[1]
    inversions_split = merge_inversions(sequence, left, mid, right)[1]
    [sequence, inversions_left + inversions_right + inversions_split]
  else
    [sequence, 0]    
  end
end

def merge_inversions(sequence, left, mid, right)
  subarray_left = sequence[left..mid]
  subarray_right = sequence[(mid + 1)..right]
  left_length = subarray_left.length

  subarray_left.push Float::INFINITY
  subarray_right.push Float::INFINITY

  inversions_count = 0

  i = j = 0
  left.upto(right) do |index|
    if subarray_left[i] <= subarray_right[j]
      sequence[index] = subarray_left[i]
      i += 1
    else
      sequence[index] = subarray_right[j]
      inversions_count += left_length - i
      j += 1
    end
  end

  [sequence, inversions_count]
end

array_1 = [4,11,13,3,9,12]
array_2 = [2,4,5,7,1,2,3,6]

puts merge_sort(array_1, 0, 5).inspect
puts merge_sort(array_2, 0, 7).inspect

array = File.readlines('IntegerArray.txt').map { |str| str.gsub!(/\r\n/, '').to_i }
puts merge_sort(array, 0, (array.size - 1)).inspect
