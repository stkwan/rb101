=begin

Halvsies

Write a method that takes an Array as an argument, 
and returns two Arrays (as a pair of nested Arrays) 
that contain the first half and second half of the original 
Array, respectively. If the original array contains an odd 
number of elements, the middle element should be placed 
in the first half Array.



Problem/objective: Return a 2d array of elements of original array split into 2 sub arrays.
If odd number of elements, put that middle element in the first array.

Edge cases:
 - odd number of ele's
 - one number in original array
 - no elements in original array
 
input: array
output: 2d array

Questions? no

algo:

- determine if size is odd or even
- if even, split the array evenly ensuring that each subarray are the same size
- if odd, give the first subarray the element
- place the two subarrays into a final array and return it

=end

def halvsies(arr)
  if arr.size.even?
    slicer = arr.size / 2
    second_half = arr.slice(slicer, slicer)
    first_half = arr.take(slicer)
  elsif arr.size.odd?
    slicer = (arr.size / 2) + 1
    second_half = arr.slice(slicer, slicer - 1)
    first_half = arr.take(slicer)
  end
  [first_half, second_half]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]