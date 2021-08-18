# ask for two nums
# ask for operator
# display the result

puts "Enter a number:"
num1 = gets.chomp.to_f

puts "Enter another number:"
num2 = gets.chomp.to_f

puts "Enter the operation would you like to perform: 'add' 'subtract' 'multiply' or 'divide'" 
operation = gets.chomp

if operation == "add"
  result = num1 + num2
elsif operation == "subtract"
  result = num1 - num2
elsif operation == "multiply"
  result = num1 * num2
elsif operation == "divide"
  result = num1 / num2
end

puts "The answer is #{result}"






