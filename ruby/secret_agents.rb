=begin
Method 1 Pseudocode
-Look at the first letter of the string
  -If the character isn't a space
    -Advance character to next letter in alphbet
    -move to next letter in the string
  -If value is a " " do not change
    -advance to next letter in string wihtout making any changes
  -When the last character of the string is reached terminate process

Method 2 Pseudocode
-Look at the first letter of the string
-If the character isn't a space
  -Move character to previous letter in alphbet
  -move to next letter in the string
-If value is a " " do not change
  -advance to next letter in string wihtout making any changes
-When the last character of the string is reached terminate process
=end

def encrypt (text)
  n = 0
  while n <= text.length
      if text[n] != " "
        if text[n] == "z"
          text[n] = "a"
          n += 1
        else
          text[n] = "#{text[n]}".next
          n += 1
        end
      else
        n += 1
      end
  end
  return text
end

def decrypt(text)
  n = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  while n < text.length
      if text[n] != " "
        text[n] = alphabet[alphabet.index("#{text[n]}") - 1]
        n += 1
      elsif text[n] = " "
        n +=1
      end
  end
  return text
end

=begin
decrypt(encrypt("swordfish"))
This nested method call works because the outer method, decrypt, is going
to use the return value of the inner method, encrypt, as it's input. Thus
encrypt will process "swordfish" and return "txpsegjti". Then, decrypt
will undo that process and return the "swordfish".

Interface Pseudocode
-Ask the user whether they would like to encrpyt or decrpyt the password
  -Ask user for the password
    -If the user entered encrypt previously
      -Run the encrypt method
    -If the user entered decrypt previously
      -Run the decrpyt method
  -Output the results of the method
  -Exit the program
=end

puts "Hello Agent. Would you like to encrypt or decrypt your password?"
method = gets.chomp
until (method.downcase == "encrypt") || (method.downcase == "decrypt")
  puts "That's not an option. Please enter encrpyt or decrypt."
  method = gets.chomp
end
if method.downcase == "encrypt" 
  print "Enter the password you would like to #{method.downcase}: "
  password = gets.chomp
  encrypt(password)
  puts password
elsif method.downcase == "decrypt"
  print "Enter the password you would like to #{method.downcase}: "
  password = gets.chomp
  decrypt(password)
  puts password
end
exit
