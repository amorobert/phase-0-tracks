#Release 1
#declare and populate an hash
students = {"Bob" => "Computer Science", "Caitlin" => "Political Ecology", "Anita" => "Interior Design"}

#iterate through hash with .each
students.each do |name, major|
  puts name
end

#modify hash  with .mao
modified_students = students.map do |name, major|
  major.upcase
end

#display modified hash
puts "After .map call:"
p modified_students


#declare an array
junkfood = ["Cookies", "Cake", "Cupcakes"]
modified_junkfood= []

#iterate through array with .each
junkfood.each do |food|
  puts food
end

#modify array with .map!
junkfood.map! do |food|
  food.upcase
end

#display modified array
puts "After .map call:"
p junkfood


#Release 2
# 1. method that iterates through the items, deleting any that meet a certain condition.
# declare and populate an array
names = ["Bob", "Kate", "Robin", "Tom"]
# delete item in array if given condition is met
names.delete_if {|name| name.length>3}
p names

#declare and populate a hash
name_age = {"Bob" => 2, "Kate" => 30, "Robin" =>10, "Tom"=> 50}
#delete item in hash if given condition is met
name_age.delete_if {|name, age| age<20}
p name_age

#2.method that filters a data structure for only items that do satisfy a certain condition
#declare and populate an array
names = ["Bob", "Kate", "Robin", "Tom"]
#keep item in array if given condition is met
names.select! {|name| name.length>3}
p names

#declare and populate a hash
name_age = {"Bob" => 2, "Kate" => 30, "Robin" =>10, "Tom"=> 50}
#keep key:value pair in hash if given condition is met
name_age.select! {|name, age| age<20}
p name_age

#3. different method that filters a data structure for only items satisfying a certain condition.
#declare and populate an array
names = ["Bob", "Kate", "Robin", "Tom"]
#remove the key:value pair if the given condition is not met
names.reject! {|name| name.length==3}
p names

#declare and populate a hash
name_age = {"Bob" => 2, "Kate" => 30, "Robin" =>10, "Tom"=> 50}
#remove the key:value pair if given condition is not met
name_age.reject! {|name, age| age<20}
p name_age
