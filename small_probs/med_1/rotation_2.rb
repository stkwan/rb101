=begin
Write a method that can rotate the last n digits of a number. For example:

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.


Problem/objective: Given two integers. int1 is the one that will rotate and int2 
is the number of digits counting beginning from the right that we will have to rotate.

Algo:

for int1, split it into single digits in to an array.
from the right of the array, reference elements [-n..-1] and call the prevous rotate method on it
the digits from the left remaian the same
join the array and turn it back into a digit
return the digit

=end

def rotate_rightmost_digits(int, n)
  digits_arr = int.to_s.chars
  digits_arr[-n..-1] = rotate_array(digits_arr[-n..-1])
  digits_arr.join('').to_i
end

def rotate_array(arr)
  new_arr = arr.dup
  new_arr << new_arr.shift
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

