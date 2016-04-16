=begin
Method 1
-Look at the first letter of the string
  -Progress letter to next character if value is a " "
    -If value is a " " do not change
    -When the last character of the string is reached terminate process

Method 2
-Look at the first letter of the string
  -Move one character backwards
    -When the last character of the string is reached terminate process
=end

def encrypt ()
  puts "Enter a string"
  text = String(gets.chomp)
  n = 0
  while n <= text.length
      if text[n] != " "
        text[n] = "#{text[n]}".next
        n += 1
      elsif text[n] = " "
        n +=1
      end
  end
  puts text
end

def decrypt()
  puts "Enter a string"
  text = String(gets.chomp)
  #Performs letter advance
  n = 0
  while n <= text.length
      if text[n] != " "
        text[n] = "#{text[n]}".next
        n += 1
      elsif text[n] = " "
        n +=1
      end
  end
#Returns value of n to zero and restores string to original state
  n = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  while n <= text.length
      if text[n] != " "
        text[n] = alphabet[alphabet.index("#{text[n]}") - 1]
        n += 1
      elsif text[n] = " "
        n +=1
      end
  end
  puts text
end
