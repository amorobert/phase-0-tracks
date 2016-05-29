# Virus Predictor

# I worked on this challenge [with: Garret Bernstein ].
# We spent [1] hours on this challenge.

# EXPLANATION OF require_relative
# This references another file to gather relevant data, to use in a method.
#
require_relative 'state_data'

class VirusPredictor
#creates a new state, takes 3 variables. and assigns them to instance variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
#runs two different methods, calling instance variables as their arguments
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
#references state data on population density and population. greater population densities yield greater percentages of predicted deaths.
  def predicted_deaths
    #ref_deaths = {200 => .4, 150 => .3, 100 => .2, 50 => .1}
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
#creates a method for speed of virus spread. as population density is greater, the time for the virus to spread is less.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each do |state_name,stats|
  state_each = VirusPredictor.new(state_name, stats[:population_density], stats[:population] )
  state_each.virus_effects
end

#=======================================================================
# Reflection Section
