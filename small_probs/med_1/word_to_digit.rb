=begin

Write a method that takes a sentence string as input, 
and returns the same string with any sequence of the 
words 'zero', 'one', 'two', 'three', 'four', 'five', 
'six', 'seven', 'eight', 'nine' converted to a string of digits.

Problem/objective: return the same string mutated; where 
the spell out word of numbers are integers in string form.  
i.e. "five" => "5"

algo:
- create a constant NUMBERS where keys are nums spelled 
out, and values are integer strings i.e. "five" => "5"
- use gsub! to mutate the string when a match is found 
between a substring and a key of the hash, replace it 
with the value of the hash
- return the mutated string

=end

NUMS = { "zero" => "0", "one" => "1", "two" => "2", "three" => "3", 
"four" => "4", "five" => "5", "six" => "6", "seven" => "7", 
"eight" => "8", "nine" => "9" }

def word_to_digit(string)
  NUMS.each do |word, num|
    string.gsub!(word, num)
  end
  
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'