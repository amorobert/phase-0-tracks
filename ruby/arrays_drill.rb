def combo(arr, value)
	arr << value
	return arr
end

def combination(x,y,z)
  array = []
  array << x << y << z
  return array
end

zoo_animals = zoo_array = []
zoo_animals << "tiger" << "giraffe" << "elephant" << "lion" << "monkey"
zoo_animals.delete_at(2)
zoo_animals.insert(2, "gorilla")
zoo_animals.shift

its_here = zoo_animals.include?("tiger") == true

if its_here
  puts "The zoo has a tiger here!"
else
  puts "Unfortunately, the zoo doesn't have a tiger..."
end

zoo_keepers = ["Robert", "Becca"]

zoo = zoo_keepers + zoo_animals
p zoo

combination("cow","pig","chicken")
p combo(["Jill","Bob","Henry"], "Sarah")
p combo([1,2,3],4)
