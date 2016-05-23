=begin
module Shout
  def self.yell_angrily(words)
    words + "!!!" + ":("
  end

  def self.yelling_happily(words)
    words + "!!!" + ":)"
  end
end

p Shout.yell_angrily("I hit my toe")
p Shout.yelling_happily("Yay")
=end
module Shout
  def yell_angrily(words)
    words + "!!!" + ":("
  end

  def yelling_happily(words)
    words + "!!!" + ":)"
  end
end

class Bingo_winner
  include Shout
end

class Baby
  include Shout
end

granny = Bingo_winner.new
soiled = Baby.new

p granny.yelling_happily("Bingo")
p soiled.yell_angrily("WaAaAaAah")
