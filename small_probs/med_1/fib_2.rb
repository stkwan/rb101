#def fibonacci(n)
#  if n < 2
#    n
#  else
#    fibonacci(n - 1) + fibonacci(n - 2)
#  end
#end

# my initial solution
#def fibonacci(n)
#  return 1 if n <= 2
#  
#  first_num = 1
#  last_num = 1
#  
#  loop do
#    last_num = last_num + first_num
#    first_num = last_num - first_num
#    n -= 1
#    break if n == 2
#  end
#  last_num
#end

def fibonacci(n)
  first, last = 1, 1
  
  3.upto(n) do |nth|
    first, last = last, first + last
  end
  
  last
end




p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501