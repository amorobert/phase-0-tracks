class Santa
  attr_reader :age, :ethnicity
  attr_accessor :gender

  def initialize(gender, ethnicity)
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    p "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    p "That was a good #{cookie}!"
  end

def celebrate_birthday
  @age += 1
end

  def get_mad_at(reindeer)
    index = @reindeer_ranking.index("#{reindeer}")
    @reindeer_ranking.delete_at(index)
    @reindeer_ranking << reindeer
  end
end
=begin
p grinch = Santa.new("male", "green")
p grinch.speak
p grinch.eat_milk_and_cookies("white chocolate & macadamia nut cookie")
p grinch.get_mad_at("Dasher")
puts "The Grinch is #{grinch.ethnicity} and is #{grinch.age} years old."
=end
genders = ["male", "female", "asexual", "N/A", "female", "genius", "bigender","agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
ethnicities = ["Sayain", "Greek", "single cell organism", "robot", "prefer not to say", "Kanye", "Namekian", "black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
100.times do
   new_santa = Santa.new(genders.sample, ethnicities.sample)
   rand(141).times {new_santa.celebrate_birthday}
   puts "This santa is a #{new_santa.ethnicity} #{new_santa.gender} who is #{new_santa.age} years old"
end
