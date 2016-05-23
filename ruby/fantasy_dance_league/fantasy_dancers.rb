class Dancer
attr_reader :name, :card
attr_accessor :age

def initialize(name, age)
  @name = name
  @age = age
  @card = []
end

def pirouette
  p "*twirls*"
end

def bow
  p "*bows*"
end

def queue_dance_with(dancer)
  @card << dancer
end

def begin_next_dance
  output = "Now dancing with #{@card[0]}."
  @card.shift
  output
end
#####Makes dancer leap
def leap
  p "*leaps*"
end
end
