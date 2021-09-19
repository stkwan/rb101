=begin

Write a method that rotates an array by moving 
the first element to the end of the array. 
The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! 
for your implementation.


Problem/objective: return a new array where the first 
ele has been moved to become the last ele in the array. 
The original array should not be modified. Do not use Array#rotate(!)

implicit no
explicit no
questions: no
edge cases no

examples below.

algo:
make a duplicate of the input array.
perform shift to remove the first ele, and store that value in a variable
add that variable to the end of the array
return the duplicate array.

=end


def rotate_array(arr)
  new_arr = arr.dup
  new_arr << new_arr.shift
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

