# Insertion Sort: (Cormen Chapter 2) in place algorithm
# Input: An array of n numbers
# Output: A sorted array of numbers

def insertion_sort(sequence)
  return sequence if sequence.length == 1
  index = 1

  loop do
    break if index == sequence.length
    key = sequence[index]
    m = index - 1
    #puts "Index: #{index}: #{sequence.inspect}"


    while m >= 0 && sequence[m] > key
      sequence[m + 1] = sequence[m]
      #puts "Moving: #{m} #{sequence.inspect}"
      m -= 1
    end
    sequence[m + 1] = key
    #puts "Moved key: #{sequence.inspect}"
    index += 1
  end

  sequence
end


def insertion_sort_ruby(sequence)
  sequence[1..-1].each_with_index do |key, index|
    m = index
    while m >= 0 && sequence[m] > key
      sequence[m + 1] = sequence[m]
      m -= 1
    end
    sequence[m + 1] = key
  end

  sequence
end

puts insertion_sort([5,2,4,6,1,3]) == [1,2,3,4,5,6] ? "insertion_sort([5,2,4,6,1,3]) is correct" : "insertion_sort([5,2,4,6,1,3]) is correct"
array = (0..1000).to_a
puts insertion_sort(array.shuffle) == array ? "insertion_sort(array.shuffle) is correct" : "insertion_sort(array.shuffle) is incorrect"

puts insertion_sort_ruby([5,2,4,6,1,3]) == [1,2,3,4,5,6] ? "insertion_sort([5,2,4,6,1,3]) is correct" : "insertion_sort([5,2,4,6,1,3]) is correct"
puts insertion_sort_ruby(array.shuffle) == array ? "insertion_sort(array.shuffle) is correct" : "insertion_sort(array.shuffle) is incorrect"
