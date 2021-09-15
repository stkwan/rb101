=begin

input: string
output: boolean (true or false)

true if a substring can be found which when multiplied
would be able to build the input string

false otherwise.

for "aaaa",  "a" counts as a substring

algo:

1. helper method
create a method which returns all substrings of a word in an array

2. primary method
get all substrings and put in an array
iterate thoguht the substrings passing each substring to the block
multiplier = string.length divided by the substring.length
if the substring * multiplier is equal to the input string, 
then true

if method does not return true then false is returned at the end

=end

#def get_substrings(str)
#  substrings = []
#  (0...str.length).each do |first_idx|
#    (first_idx...str.length).each do |last_idx|
#      substring = str[first_idx..last_idx]
#      substrings << substring unless substring.size > str.size / 2
#    end
#  end
#  substrings
#end
#
#def substring(str)
#  substrings = get_substrings(str)
#  substrings.each do |substring|
#    multiplier = str.length / substring.length
#    if substring * multiplier == str
#      return true
#    end
#  end
#  false
#end

def substring(str)
  substr_arr = []
  1.upto(str.length / 2) do |length|
    if str.length % length == 0
      substr_arr << str[0...length]
    end
  end
  
  substr_arr.each do |substring|
    multiplier = str.length / substring.length
    return true if substring * multiplier == str
  end
      
  false
end

 
p substring("abab") == true
p substring("aba") == false
p substring("aabaaba") == false
p substring("abaababaab") == true
p substring("abcabcabcabc") == true