=begin

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.

=end


def minilang(string)
  register = 0
  stack = []
  string.split.each do |command|
    if command.to_i.to_s == command
      register = command.to_i
    elsif command == "PUSH"
      PUSH(stack, register)
    elsif command == "MULT"
      register = MULT(stack, register)
    elsif command == "PRINT"
      PRINT(register)
    elsif command == "ADD"
      register = ADD(stack, register)
    elsif command == "SUB"
      register = SUB(stack, register)
    elsif command == "DIV"
      register = DIV(stack, register)
    elsif command == "MOD"
      register = MOD(stack, register)
    elsif command == "POP"
      register = POP(stack)
    end
  end
  
end


def PUSH(stk, register)
  stk.push(register)
end

def MULT(stk, register)
  register * stk.pop
end

def PRINT(register)
  puts register
end

def ADD(stk, register)
  register + stk.pop
end

def SUB(stk, register)
  register - stk.pop
end

def DIV(stk, register)
  register / stk.pop
end

def MOD(stk, register)
  register % stk.pop
end

def POP(stk)
  stk.pop
end


LS solution

#def minilang(string)
#  register = 0
#  stack = []
#  string.split.each do |command|
#    case command
#    when "PRINT" then puts register
#    when "PUSH"  then stack.push(register)
#    when "MULT"  then register *= stack.pop
#    when "ADD"   then register += stack.pop
#    when "SUB"   then register -= stack.pop
#    when "DIV"   then register /= stack.pop
#    when "MOD"   then register %= stack.pop
#    when "POP"   then register = stack.pop
#    else              register = command.to_i
#    end
#  end
#  
#end


minilang('PRINT')
# 0

puts ''

minilang('5 PUSH 3 MULT PRINT')
# 15

puts ''

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

puts ''

minilang('5 PUSH POP PRINT')
# 5

puts ''

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

puts ''

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

puts ''

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

puts ''

minilang('-3 PUSH 5 SUB PRINT')
# 8

puts ''

minilang('6 PUSH')
# (nothing printed; no PRINT commands)