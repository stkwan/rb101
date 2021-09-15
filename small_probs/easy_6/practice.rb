require 'pry'
=begin

For a given nonempty string s find a minimum substring t and the maximum number k, 
such that the entire string s is equal to t repeated k times. 
The input string consists of lowercase latin letters. 
Your function should return a tuple (in Python) (t, k) 
or an array (in Ruby and JavaScript) [t, k]

Example #1:

for string

s = "ababab"
the answer is

["ab", 3]
Example #2:

for string

s = "abcde"
the answer is

["abcde", 1]
because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

=end

=begin

Problem:
Find the repeating substring and how many times it repeats 

Input: string
Output: array containing the repeating substring and the number of times it is repeated. [string, integer]

Question: for "aaaaa" is "a" considered a substring.

Examples:
p assert_equals("ababab") == ["ab", 3]
p assert_equals("abcde") == ["abcde", 1]

Data structures:
Array
String

Algo:
 - find the substrings of the string and put them in an array
 - for each substring, multiply it starting from 2 until the size is greater then the string
 - if the result equals string, shovel substring and number into array

=end
#def find_substrings(str)
#  sub_strings = []
#  (0...str.length).each do |starting_index|
#    (starting_index...str.length).each do |last_index|
#      sub_strings << str[starting_index..last_index]
#    end
#  end
#  sub_strings
#end
#
#def assert_equals(string)
#  substrings = find_substrings(string)
#  
#  substrings.each do |substring|
#    multiplier = string.length / substring.length
#    if substring * multiplier == string
#      return [substring, multiplier]
#    end
#  end
#   
#end
#p assert_equals("ababab") #== ["ab", 3]
#p assert_equals("abcde") #== ["abcde", 1]





#def assert_equals(string)
#  chars = string.chars
#  substrings = []
#  
#  (1..string.length/2).to_a.each do |num|
#    substrings << chars.take(num).join
#  end
#  
#  substrings.each do |str|
#    repeat = string.length / str.length
#    if str * repeat == string
#      return [str, repeat]
#    end
#  end
#  [string, 1]
#end
#
#p assert_equals("ababab") == ["ab", 3]
#p assert_equals("abcde") == ["abcde", 1]
#p assert_equals("aaaaa") == ["a", 5]
#p assert_equals("a") == ["a", 1]


def substrings(str)
 substrings = []
 (0...str.length).each do |starting_idx|
   (starting_idx...str.length).each do |ending_indx|
     substrings << str[starting_idx..ending_indx]
   end
 end
 substrings
end

p substrings("steven")