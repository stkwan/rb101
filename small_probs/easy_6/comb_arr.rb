=begin
Combining Arrays:

Write a method that takes two Arrays as arguments, 
and returns an Array that contains all of the values 
from the argument Arrays. There should be no duplication 
of values in the returned Array, even if there are duplicates 
in the original Arrays.


Example:

=end

=begin
Problem/objective: Given two arrays as inputs, return 
                    a single array containing only unique elements
input: two arg, both arrays
output: single arr


algo:
- combine arrays and store in a varriable new_array
- call .uniq on new_array and return it


=end

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]