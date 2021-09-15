=begin

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) 
such that the first 2 numbers are 1 by definition, and each subsequent number 
is the sum of the two previous numbers. This series appears throughout 
the natural world.

Computationally, the Fibonacci series is a very simple series, but the results 
grow at an incredibly rapid rate. For example, the 100th Fibonacci number 
is 354,224,848,179,261,915,075 -- that's enormous, especially considering 
that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci 
number that has the number of digits specified as an argument. (The first 
Fibonacci number has index 1.)

Examples:



find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

=begin

PROBLEM: 

Input: Integer (represents number of digits of fib number)
Output: Return an the length of an array containing all of the fib numbers 
up to and including the first one that has the number of digits as an argument)


Rules:

Explicit:
Implicit:



Questions?

Edge cases?


------------------
EXAMPLES: 
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847




------------------
DATA STRUCTURES: 

array

---

ALGORITHM:

=> High Level: 
- initialize empty array
- Build a loop that is able to return the next number in the fib sequence
- Every iteration of the loop, put one fib number in the new array
- If the fib number is equal to the argument then break.
- return the array.size

=> Steps: 
 
 BEGIN method
 start_arr = [1, 1]
  loop start
    next_fib = (start_arr[-2] + start_arr[-1])
    start_arr << next_fib
    break if next_fib.size == input
  loop end
 start_arr.size
 END method
    
=end


def find_fibonacci_index_by_length(fib_digits)
  start_arr = [1, 1]
  
  next_num = 0
  loop do
    
    next_num = start_arr[-2] + start_arr[-1]
    start_arr << next_num
    break if next_num.to_s.size >= fib_digits
  end
  start_arr.size
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847