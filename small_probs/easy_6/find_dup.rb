=begin

Given an unordered array and the information 
that exactly one value in the array occurs twice 
(every other value occurs exactly once), how would 
you determine which value occurs twice? Write a method 
that will find and return the duplicate value that is 
known to be in the array.

Problem/objective: Given an array as an input, find the element that
occurs twice (every other element occurs once).

input: array
output: single integer represeting the integer that occured twice

edge cases? no
quetions? no

data structures? array

algo:
- initialize a hash where all values equal zero
- iterate through the array of integers. For each integer, place
as key in hash and have the value be the count of how many times
it appears in the array.
- Once all elements have been added to hash with thier counts,
return the key that has a value of the integer 2

=end

=end

#my ans:

#def find_dup(arr)
#  count = Hash.new(0)
#  
#  arr.each do |integer|
#    count[integer] += 1
#  end
#  
#  count.each do |k, v|
#    return k if v == 2
#  end
#end


# LS ans:
def find_dup(arr)
  arr.find { |num| arr.count(num) == 2 }
end



p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73