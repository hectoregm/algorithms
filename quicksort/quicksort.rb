# Summary: Algorithm to sort an array of numbers (in place)
# Input: An array of n numbers
# Ouput: A sorted array of n numbers
# Complexity: O(n * log n) (average)
# Wiki: http://en.wikipedia.org/wiki/Quicksort
# Cormen: page 170 (hardcover), 191 (pdf)

class Array
  def swap!(a,b)
    self[a], self[b] = self[b], self[a]
  end
  self
end

def quicksort(array, left, right, type = :first)
  return 0 if left >= right
  pivot = partition(array, left, right, type)
  comparisons_left = quicksort(array, left, pivot - 1, type)
  comparisons_right = quicksort(array, pivot + 1, right, type)
  (right - left) + comparisons_left + comparisons_right
end

def partition(array, left, right, type)
  choose_pivot(array, left, right, type) #array[left]
  pivot = array[left]
  i = left + 1

  (i..right).each do |j|
    if array[j] < pivot
      array.swap!(i,j)
      i += 1
    end
  end
  array.swap!(left,i-1)

  i-1
end

def choose_pivot(array, left, right, type = :first)
  case type
  when :first
  when :last
    array.swap!(left,right)
  when :median_of_three
    middle = left + ((right - left) / 2.0).floor

    # pivot = [array[left], array[middle], array[right]].sort[1]
    if array[left] < array[middle]
      if array[right] < array[left]
        index = left
      elsif array[right] < array[middle]
        index = right
      else
        index = middle
      end
    else
      if array[right] < array[middle]
        index = middle
      elsif array[left] < array[right]
        index = left
      else
        index = right
      end
    end

    array.swap!(left, index)
  end
end


array_1 = [4,11,13,3,9,12]
array_2 = [2,4,5,7,1,2,3,6]
array_3 = (0...1000).to_a.shuffle!

# Check sorting correctness

quicksort(array_1, 0, 5)
puts array_1 == [4,11,13,3,9,12].sort ? "quicksort([4,11,13,3,9,12], 0, 5) is correct" : "quicksort([4,11,13,3,9,12], 0, 5) is incorrect"

quicksort(array_2, 0, 7)
puts array_2 == [2,4,5,7,1,2,3,6].sort ? "quicksort([2,4,5,7,1,2,3,6], 0, 7) is correct" : "quicksort([2,4,5,7,1,2,3,6], 0, 7) is incorrect"

quicksort(array_3, 0, 999)
puts array_3 == (0..999).to_a ? "quicksort(<array(size:1000)>, 0, 999) is correct" : "quicksort(<array(size:1000)>, 0, 999) is incorrect"

# Check comparison correctness

array_10 = File.readlines('10.txt').map { |str| str.to_i }
puts "Array on 10.txt has 25 comparisons (first): " +
  "#{quicksort(array_10, 0, 9) == 25}"

array_100 = File.readlines('100.txt').map { |str| str.to_i }
puts "Array on 100.txt has 615 comparisons (first): " +
  "#{quicksort(array_100, 0, 99) == 615}"

array_1000 = File.readlines('1000.txt').map { |str| str.to_i }
puts "Array on 1000.txt has 10297 comparisons (first): " +
  "#{quicksort(array_1000, 0, 999) == 10297}"


array_10 = File.readlines('10.txt').map { |str| str.to_i }
puts "Array on 10.txt has 29 comparisons (last): " +
  "#{quicksort(array_10, 0, 9, :last) == 29}"

array_100 = File.readlines('100.txt').map { |str| str.to_i }
puts "Array on 100.txt has 587 comparisons (last):" +
  "#{quicksort(array_100, 0, 99, :last) == 587}"

array_1000 = File.readlines('1000.txt').map { |str| str.to_i }
puts "Array on 1000.txt has 10184 comparisons (last): " +
  "#{quicksort(array_1000, 0, 999, :last) == 10184}"



array_10 = File.readlines('10.txt').map { |str| str.to_i }
puts "Array on 10.txt has 21 comparisons (median): " +
  "#{quicksort(array_10, 0, 9, :median_of_three) == 21}"

array_100 = File.readlines('100.txt').map { |str| str.to_i }
puts "Array on 100.txt has 518 comparisons (median): " +
  "#{quicksort(array_100, 0, 99, :median_of_three) == 518}"

array_1000 = File.readlines('1000.txt').map { |str| str.to_i }
puts "Array on 1000.txt has 8921 comparisons (median): " +
  "#{quicksort(array_1000, 0, 999, :median_of_three) == 8921}"


array = File.readlines('QuickSort.txt').map { |str| str.gsub!(/\r\n/, '').to_i }
puts "Array on QuickSort.txt has 162085 comparisons (first): " +
  "#{quicksort(array.dup, 0, (array.size - 1)) == 162085}"
puts "Array on QuickSort.txt has 164123 comparisons (last): " +
  "#{quicksort(array.dup, 0, (array.size - 1), :last) == 164123}"
puts "Array on QuickSort.txt has 138382 comparisons (median): " +
  "#{quicksort(array.dup, 0, (array.size - 1), :median_of_three) == 138382}"
