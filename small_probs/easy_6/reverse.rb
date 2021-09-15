

=begin
Write a method that takes an Array as an argument, 
and reverses its elements in place; that is, mutate the 
Array passed into this method. The return value should be 
the same Array object.

You may not use Array#reverse or Array#reverse!.

=end

=begin

Problem/objective: return the same array reversed
input: array
output: same array reversed

Examples:
edge cases:
- if input array is empty, return empty input array 
- if input array has only one element return array with one element


data structures:
must account for integers and strings in our input array

algo:

a = [1, 2, 3, 4]
want = [4, 3, 2, 1]

- iterate through the array looking two numbers at a time (likely be a nested loop) Use the spaceship operator
  to evaluate if numbers are in right order, we should get +1 if not switch numbers

- Continue this process until the array is sorted
- return the array

=end

#def reverse!(arr)
#  first_pos = 0
#  last_pos = -1
#  
#  loop do
#    break if first_pos == (arr.size / 2)
#    arr[first_pos], arr[last_pos] = arr[last_pos], arr[first_pos]  # 1, 4 = 4, 1
#    first_pos += 1
#    last_pos -= 1
#  end
#
#  arr
#end



#list = [1,2,3,4]
#result = reverse!(list)
#p result == [4, 3, 2, 1] # true
#p list == [4, 3, 2, 1] # true
#p list.object_id == result.object_id # true
#
#list = %w(a b e d c)
#p reverse!(list) == ["c", "d", "e", "b", "a"] # true
#p list == ["c", "d", "e", "b", "a"] # true
#
#list = ['abc']
#p reverse!(list) == ["abc"] # true
#p list == ["abc"] # true
#
#list = []
#p reverse!(list) == [] # true
#p list == [] # true

# using inject/reduce
#def reverse(array)
#  array.inject([]) { |new_arr, element| [element] + new_arr }
#end

# using each_with object
def reverse(array)
  array.each_with_object([]) { |ele, new_arr| new_arr.prepend(ele) }
end


p reverse([1,2,3,4]) == [4,3,2,1]         # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true