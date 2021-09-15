=begin

Write a method named include? that takes an Array and a search 
value as arguments. This method should return true if the search 
value is in the array, false if it is not. You may not use the 
Array#include? method in your solution

Problem/objective: Return a boolean true or false, given inputs 
of an array and a some other element. If that element is in the 
array, then return true. False if not

Rules:
implicit:
explicit: you cannot use the include? method

questions? no
edge cases? no

data structures:
array

algo:
- iterate thorugh the given array. for each element the array, 
see if it matches the other argument i.e. the "search value"
- If there is a match, return true immediately
- After all elements have been checked, and none returned true,
return false

- thiking about using any?

=end

def include?(arr, search)
  arr.any? { |ele| ele == search }
end


include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false