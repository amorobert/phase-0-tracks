=begin
-Create a new array of hashes named client to store subsequent user input
  -Ask for the client's name
    -pair with name key
    -Store user input as string
  -Ask for the client's age
    -pair with age key
    -Store user input as integer
  -Ask for how many children the client has
    -Pair with num_of_children key
    -Store user input as integer
  -Ask if the client has any toddlers
    -Pair with toddler key
    -Store user input as boolean
  -Ask for the client's decor theme
    -Pair with decor_theme key
    -Store user input as string
  -Ask if the client's space needs to be handicap accessible
    -Pair with the accessibility key
    -Store user input as boolean
-Print the values stored in the array
-Ask the user to enter the key of mistaken entries
  -Store user input as string
    -Convert the string into a key
  -Ask the user for the new value of the key
    -Store the input as correct data type
-Exit the program
=end
client = {
  name: nil,
  age: 18,
  num_of_children: 0,
  toddler: false,
  decor_theme: nil,
  accessibility: false,
  }
puts "What's your name?"
client[:name] = String(gets.chomp)
puts "How old are you?"
client[:age] = Integer(gets.chomp)
puts "How many children do you have if any?"
client[:num_of_children] = Integer(gets.chomp)
puts "Do you have a toddler(s)? (y or n)"
has_little_demon = String(gets.chomp)
if has_little_demon == "y"
  client[:toddler] = true
else
  client[:toddler] = false
end
puts "What's your decor theme?"
client[:decor_theme] = String(gets.chomp)
puts "Does your space need to be handicap accessible? (y or n)"
needs_accessibility = String(gets.chomp)
if needs_accessibility == "y"
  client[:accessibility] = true
else
  client[:accessibility] = false
end
client.each {|key, value| puts "#{key}: #{value}"}
puts "Enter a field that needs to be corrected."
correction = String(gets.chomp)
puts "Enter the correction"
case "#{correction}".to_sym
when :name
  client[:name] = String(gets.chomp)
when :age
  client[:age] = Integer(gets.chomp)
when :num_of_children
  client[:num_of_children] = Integer(gets.chomp)
when :toddler
  client[:toddler] = Boolean(gets.chomp)
when :decor_theme
  client[:decor_theme] = String(gets.chomp)
when :accessibility
  client[:accessibility] = Boolean(gets.chomp)
end
client
