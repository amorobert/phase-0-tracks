puts "How many employees will be processed?"
numOfEmployees = Integer(gets.chomp)

numOfEmployees.times do
puts "Whats your name? "
name = gets.chomp
puts "How old are you?"
age = gets.chomp
puts "What year were you born?"
birthYear = gets.chomp
puts "Our company cafeteria serves gaarlic bread. Should we order some for you? (y or n)"
garlicAnswr = gets.chomp
puts "Would you like to enroll in the company's health insurance? (y or n)"
healthAnswr = gets.chomp

allergies = hash.new
n = 0
loop do
  puts "Enter any allergies you have one by one. Type done if you have none or when finished."
  allergies[n] = gets.chomp
  n += 1
  break allergies[n] = "done"
end

allergies.each do
if ((2016 - age == birthYear) && ((garlicAnswr == y) || (healthAnswr == y))
  puts "Probably not a vampire."
elsif ((2016 - age != birthYear) && ((garlicAnswr == n) || (healthAnswr == n))
  puts "Probably a vampire."
elsif ((2016 - age != birthYear) && ((garlicAnswr == n) && (healthAnswr == n))
  puts "Almost certainly a vampire."
elsif (name == “Drake Cula” || “Tu Fang”)
  puts "Definitely a vampire."
else
  puts "Results conclusive"
end
