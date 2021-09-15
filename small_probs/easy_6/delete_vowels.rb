=begin

Write a method that takes an array of strings, and returns an array 
of the same string values, except with the vowels (a, e, i, o, u) removed.

Example:


remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

PEDAC

Input: An array containing strings
Output: Returns an array of the same string values, except vowels a e i o u are removed

Implicit:
remove both lowercase and uppercase vowels

Explicit: na


Examples: above

Data structures:
Array
String

Algo:
- Initialize an empty array called new_array
- Initialize a local variable `vowels` to a string containing both uppercase and lowercase vowels
- Iterate though the array, for each word, remove the vowels (helper method)
- Once the vowels have been removed from the word, put the word in the new_array
- Return new_array

=end

def remove_vowels(arr)
  new_arr = []
  arr.each do |word|
    new_arr << vowels_out_word(word)
  end
  new_arr
end

def vowels_out_word(word)
  new_word = ''
  vowels = "aeiouAEIOU"
  word.each_char do |char|
    if vowels.include?(char)
      new_word << ''
    else
      new_word << char
    end
  end
  new_word
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']