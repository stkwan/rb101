=begin
Write a method that displays a 4-pointed diamond in 
an n x n grid, where n is an odd integer that is supplied 
as an argument to the method. You may assume that the
argument will always be an odd integer.

problem/objective: return a diamond using the char "*" which fill up 
n x n grid. You may assume that the given argument n is always an odd integer. 

implicit: the middle of the diamond has n number of "*"'s and fill up all of the spaces alloted for that line.

- there seems to be a pattern of odd integers starting from 1, 3, 5, 7, etc. to make the diamond, where n occurs once and the others odd numbers occur twice.

-spaces before equal spaces after.

explicit: n will always be odd

examples below


deduction/examples:
max leading whitespaces == max trailing whitespaces
for 1 star there are no trailing whitespaces
for 3 stars there's one max whitespace
for 5 stars there's two max whitespaces
for 7 stars there's three max whitespaces
for 9 stars there's four max white spaces

we can deduce that the number of whitespaces given n
will be (n-1) / 2  

we can iterate 1 up to n
on each iteration, we will create a string of a peice of the diamond and put that string in subarray. 
Then put that subarray into the final array.
When we puts each element of the subarray it will create a new line for each subarray. and our diamond will appear.

how do we create string on each iteration??
using our deduction above, (n-1)/2 is the max number of spaces, we can create a helper method that will provide us with the first half of the diamond

we can create a heper method that will provide us with the middle line of the diamond

we can create a helper method that will provide us with the bottom of the diamond. 

Then we can add everything together in the final array top + middle + bottom

Example:
if we know n is 5 then the max spaces is 2. 
we can call 2.times " " and add a space then the star then call 2.times " " again
then 1
then stop once spaces == 0



Examples:

=end

# n = 5

def diamond(n)
  
  middle_portion = ["*" * n]
  
  return puts middle_portion if n == 1
  
  top_portion = []
  num_of_stars = 1
  
  loop do
    top_portion << "*" * num_of_stars
    num_of_stars += 2
    break if num_of_stars >= n
  end
  
  max_spaces = (n - 1) / 2
  
  top_portion.each do |string|
    if string.length < n
      string.prepend(" " * max_spaces)
      string << " " * max_spaces
      max_spaces -= 1
      break if max_spaces == 0
    end
  end
  
  
  bottom_portion = []
  duplicate_arr = top_portion.dup
  duplicate_arr.reverse_each do |ele|
    bottom_portion << ele
  end
  
  final_arr = top_portion + middle_portion + bottom_portion
  
  final_arr.each { |ele| puts ele }
  
end

diamond(1)

#*

diamond(3)

#  *
# ***
#  *

diamond(5)

diamond(7)


diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

diamond(11)

diamond(63)