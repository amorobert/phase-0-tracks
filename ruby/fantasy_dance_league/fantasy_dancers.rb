class Dancer
attr_reader :name
attr_accessor :age

def initialize(name, age)
  @name = name
  @age = age
end

def pirouette
  p "*twirls*"
end

def bow
  p "*bows*"
end
end
