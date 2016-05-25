# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # Split the string into an hash of idividual items and their quantity
  # set default quantity
  # print the list to the console using the print method
# output: hash

# Method to add an item to a list
# input: item and optional quantity (example: "bagels 6")
# steps:
  #Set the variable 'list' equal to the hash output of the print method
  #Store input item and quantity as key, value pair in 'list'
  #print the 'list' to the console using the print method
# output:hash

# Method to remove an item from the list
# input: item (example: "cereal")
# steps:
  #Set the variable 'list' equal to the hash output of the print method
  #Store input item and quantity as key, value pair in 'list'
  #identify the index of item to remove
  #delete item from the 'list'
  #print the 'list' to the console using the print method
# output:hash

# Method to update the quantity of an item
# input:item and quantity (example: "pizza 2")
# steps:
  #Set the variable 'list' equal to the hash output of the print method
  #identify the index of item to to update
  #set the quantity of the item to the new quantity
  # print the 'list' to the console using the print method
# output:hash

# Method to print a list and make it look pretty
# input: none
# steps:
  #Print each key value pair using the puts method
# output:string
$master_list = {}

def create_list(items)
  list = {}
  temp_array = items.split(' ')
  puts "I'm splitting the string argument, '#{items}', into an array of strings, #{temp_array}"
  temp_array.each {|item| list[item] = 1}
  puts "I'm saving these strings, #{temp_array}, as keys of the list hash with default values of 1, #{list}"
  $master_list = list
  print_list
end

def add_item(item_and_quantity)
  temp_array = item_and_quantity.split(' ')
  puts "I'm splitting the string argument, '#{item_and_quantity}', into an array of strings, #{temp_array}"
  item = temp_array[0]
  quantity = temp_array[1].to_i
  if quantity == nil
    $master_list[item] = 1
  else
    $master_list[item] = quantity
  end
  puts "I'm storing the first string, '#{item}', as a new key in the list hash. The second string, '#{quantity}', is being stored as the key's integer value if provided, otherwise the value defaults to 1. "
    print_list
end

def remove_item(item)
  $master_list.delete(item)
  puts "I'm deleting the key, value pair for '#{item}' from the list hash"
  print_list
end

def update_quantity(item_and_quantity)
  temp_array = item_and_quantity.split(' ')
  puts "I'm splitting the string argument, '#{item_and_quantity}', into an array of strings, #{temp_array}"
  item = temp_array[0]
  quantity = temp_array[1].to_i
  $master_list[item] = quantity
    puts "I'm using the first string, '#{item}', to identify the key in the list hash. The second string, '#{quantity}', is overwritting the key's value as an integer"
  print_list
end

def print_list
  $master_list.each{|item, quantity| puts "#{item}: #{quantity}"}
  $master_list
end

create_list("")
add_item("lemonade 6")
add_item("tomatoes 3")
add_item("onions 1")
add_item("ice_cream 4")
remove_item("lemonade")
update_quantity("ice_cream 1")
print_list

# What did you learn about pseudocode from working on this challenge?
#I learned that th more thurough your pseudocode is, the easier it is to write your code.
# What are the tradeoffs of using arrays and hashes for this challenge?
#Not sure
# What does a method return?
#a methd returns its last evaluated line
# What kind of things can you pass into methods as arguments?
#You can pass variables and other methods
# How can you pass information between methods?
#I used a global variable
# What concepts were solidified in this challenge, and what concepts are still confusing?
#I was able to figure out how to get my code to work, bu I'm pretty sure I didn't complete it using the inteneded method
