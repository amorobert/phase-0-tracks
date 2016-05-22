class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(how_many)
    how_many.times {p "Woof!"}
  end

  def roll_over
    p "*rolls over"
  end

  def dog_years(human_years)
    dog_years = human_years * 10.5
    p dog_years
  end

  def sit
    p "*sits"
  end

  def initialize
    p "initializing new puppy insatnce..."
  end

end

zeus = Puppy.new
zeus.fetch("ball")
zeus.speak(3)
zeus.roll_over
zeus.dog_years(2)
zeus.sit

class Drummer

  def march
    p "*marches forward"
  end

  def about_face
    p "*turns around"
  end

  def play
    p "*drum thunders"
  end

  def initialize
    "New drummer is tuning and adjusting his drum..."
  end
end

drumline = []
50.times do
   drumline << Drummer.new
end
drumline.each do |member|
	member.march
	member.about_face
	member.play
end
