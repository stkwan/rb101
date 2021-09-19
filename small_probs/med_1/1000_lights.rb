require "pry"
=begin

You have a bank of switches before you, numbered from 1 to n. 
Each switch is connected to exactly one light that is initially off. 
You walk down the row of switches and toggle every one of them. 
You go back to the beginning, and on this second pass, you 
toggle switches 2, 4, 6, and so on. On the third pass, you go 
back again to the beginning and toggle switches 3, 6, 9, and so on.
You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, 
and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

Problem/objective: Writie a method that takes one arg n which represents 
the number of lights we're working with. Return an array which contains the lights that 
are on at the end of the squence as described above. Additionally, n is also the number of rounds we must perform the switching. 

-first round all lights are on
-second round the 2nd light and every two gets toggled
-third round the 3rd light and every thrid gets toggled
-fourth round the 4th light and every fourth gets toggled
until we reach n.

edge case? no
questions? no

example as above

Data structure
hash
array

algo:

- initialize a hash where all of the values are set to the string "false" meaning that the light is off.
- use the upto method to iterate through each of the rounds up to n
- each number will become a key in the hash
- each round toggle switch as per above.
- on the first round turn on all of the switches
- on every iteration upto method will increment by 1 which means that we will use that number as both the starting light number and the interval at which we will toggle up to and including n
- after n rounds, the method will stop iterating.
- return and array of keys for which the value is true.

=end

def lights(n)
  switches = Hash.new(false)
    
  1.upto(n) do |switch|
    switches[switch] = true
  end
  
  (2..n).each do |round|
    accum = round
    switches.each do |_|
      switches[accum] = switches[accum] == true ? false : true
      accum += round
      break if accum > n
    end
  end
  switches.keys.select { |key| switches[key] } #each_with_object([]) { |(k, v), arr| arr << k if v }
end


#another solution:
#def lights(n)
#  switches = Hash.new
#
#  1.upto(n) do |switch|
#    switches[switch] = false
#  end
#
#  1.upto(n).each do |round|
#    switches.each do |switch, status|
#      if switch % round == 0
#        switches[switch] = status == true ? false : true
#      end
#    end
#  end
#
#  switches.keys.select { |key| switches[key] }
#end



 # another solution:
 
 # current_round = 2

 #loop do
 # 
 #  accum = current_round
 #  loop do
 #    
 #    if switches[accum] == true
 #      switches[accum] = false
 #    elsif switches[accum] == false
 #      switches[accum] = true
 #    end
 #    accum += current_round
 #    break if accum > n
 #  end
 #  
 #  current_round += 1
 #  break if current_round > n
 #end
 


p lights(5)
p lights(10)
p lights(1000)