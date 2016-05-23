wolves_like_sunshine = true
wolves_like_garlic = true
vampires_like_sunshine = false
vampires_like_garlic = false

puts "How many employees will be processed?"
numOfEmployees = Integer(gets.chomp)

numOfEmployees.times do
  puts "Whats your name?"
  name = String(gets.chomp)
  puts "How old are you?"
  age = Integer(gets.chomp)
  puts "What year were you born?"
  birthYear = Integer(gets.chomp)
  puts "Our company cafeteria serves garlic bread. Should we order some for you? (y or n)"
  garlicAnswr = String(gets.chomp)
  puts "Would you like to enroll in the company's health insurance? (y or n)"
  healthAnswr = String(gets.chomp)

  allergies = Array.new
  n = 0

  puts "Enter any allergies you have one by one. Type done if you have none or when finished."
while allergies[n] = gets.chomp
  case allergies[n]
  when "done"
      if (2016 - age == birthYear) && ((garlicAnswr == "y") || (healthAnswr == "y"))
        puts "Probably not a vampire."
      elsif (2016 - age != birthYear) && ((garlicAnswr == "n") || (healthAnswr == "n"))
        puts "Probably a vampire."
      elsif (2016 - age != birthYear) && ((garlicAnswr == "n") && (healthAnswr == "n"))
        puts "Almost certainly a vampire."
      elsif (name == "Drake Cula") || (name == "Tu Fang")
        puts "Definitely a vampire."
      else
        puts "Results conclusive"
      end
    break
  when "sunshine"
    puts "Probably a vampire."
    break
  else
    print "Next allergy: "
  end
end
  puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
