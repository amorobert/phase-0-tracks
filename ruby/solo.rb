=begin
Alligator Wrestler---------------

Chracteristics-------------------
Name
Years of experience
Number of fingers

Behaviors-----------------------
Mount an alligator
Stick head inside gators mouth
Lose a finger to a gator
=end

class Gator_wrestler
  attr_reader :name, :years_wrestling
  attr_accessor :fingers_left

  def initialize(name, experience)
    @name = name
    @years_wrestling = experience
    @fingers_left = 10
  end

  def lose_finger(lost_fingers)
    @fingers_left -= lost_fingers
  end

  def death_wish
    puts "*Wrestler sticks head inside of gators mouth..."
  end

  def mount_gator
    puts "*Wrestler jumps onto gators back..."
  end
end

wreslter_database = []
another_wrestler = nil
until another_wrestler == "quit"
  new_wrestler = nil
  puts "Enter the name of the alligator wrestler."
  name = String(gets.chomp)
  puts "How many years has this #{name} been wrestling gators?"
  experience = Integer(gets.chomp)
  puts "How many finger(s) has #{name} lost if any?"
  fingers_lost = Integer(gets.chomp)
  new_wrestler = Gator_wrestler.new(name, experience)
  new_wrestler.lose_finger(fingers_lost)
  wreslter_database << new_wrestler
  puts "Press enter to create another wrestler or type quit to exit."
    another_wrestler = String(gets.chomp)
end

wreslter_database.each {|wrestler| puts "#{wrestler.name} has been rough housing with gators for #{wrestler.years_wrestling} year(s) and has #{wrestler.fingers_left} finger(s)!"}
