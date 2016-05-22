=begin
-Store spy's name in an array called spy_name
-Swap the indexes of the first and last name to switch them
-Split the first and last name into arrays of idividual characters
-Iterate through each of the arrays
  -If a character is identified as a vowel, change it to the next vowel in the alphabet
  -If the character is a consonant, change it to the next consonant in the alphabet
=end

#####Increments to next vowel
def next_vowel(name_array)
  vowels = "aeiou"
  capital_vowels = "AEIOU"

  name_array.map! do |letter|
    if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
      letter = vowels[vowels.index(letter) + 1]
    elsif letter == "A" || letter == "E" || letter == "I" || letter == "O" || letter == "U"
      letter = capital_vowels[capital_vowels.index(letter) + 1]
    else
      letter = letter
    end
  end
end
#####Increments to next consonant
def next_consonant(name_array)
  consonants = "bcdfghjklmnpqrstvwxyz"
  capital_consonants = "bcdfghjklmnpqrstvwxyz".upcase
  consonant_array = "bcdfghjklmnpqrstvwxyz".split('')
  capital_consonant_array = "bcdfghjklmnpqrstvwxyz".upcase.split('')

  name_array.map! do |letter|
    if consonant_array.include?("#{letter}") == true
      letter = consonants[consonants.index(letter) + 1]
    elsif capital_consonant_array.include?("#{letter}") == true
      letter = capital_consonants[capital_consonants.index(letter) + 1]
    else
      letter = letter
    end
  end
end

alias_database = {}
another_alias = nil

until another_alias == "quit"
  #####Retrieves user input
  whole_name = []
  whole_alias = []
  puts "Enter your first name."
  first_name = String(gets.chomp)
  puts "Enter your last name."
  last_name = String(gets.chomp)
  whole_name << first_name << last_name
  #####Converts the names into arrays of letters
  first_name_array = whole_name[0].chars
  last_name_array = whole_name[1].chars
  #####Converts the real name into the alias
  first_alias = next_vowel(next_consonant(last_name_array)).join('')
  last_alias = next_vowel(next_consonant(first_name_array)).join('')
  whole_alias << first_alias << last_alias
  #####Stores name and alias into database
  alias_database[whole_name] = whole_alias
  #####Outputs the alias and offers further options
  puts "Your alias is #{first_alias} #{last_alias}. Be safe out there agent!"
  puts "Press enter to create another alias or type quit to exit."
  another_alias = String(gets.chomp)
end

#####Outputs everything stored in the database
alias_database.each {|agent_name,agent_alias| puts "#{agent_name[0]} #{agent_name[1]} is also known as #{agent_alias[0]} #{agent_alias[1]}"}
