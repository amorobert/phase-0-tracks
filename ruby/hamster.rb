puts "What's the hamsters name?"
name = String(gets.chomp)
puts "What's the volume level of the hamster?"
volume = Integer(gets.chomp)
puts "What color is the hamsters fur?"
fur = String(gets.chomp)
puts "Is the hamster suitable for adoption?"
adoptable = String(gets.chomp)
puts " What's the hamster's estimated age?"
age = gets.chomp
if (age == " ") || (age == "")
  age = nil
else
  age.to_i
end

puts "This hamster's info is:"
puts "Name: #{name.capitalize}"
puts "Volume: #{volume}"
puts "Fur Color: #{fur.capitalize}"
puts "Adoptable: #{adoptable.capitalize}"
puts "Estimate Age: #{age}"
