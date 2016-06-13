# require gems
require 'sqlite3'
require 'faker'

########## Creates SQLite3 database

db = SQLite3::Database.new('competition.db')

########## Creates and populates tricks table containting all possible skateboard tricks

create_tricks_table = <<-SQL
  CREATE TABLE IF NOT EXISTS tricks (
    id INTEGER,
    trick VARCHAR(255),
    PRIMARY KEY (id)
  );
SQL

db.execute(create_tricks_table)

trick_list = ["alpha flip", "anti casper flip", "backside flip", "backside heelflip", "big heelflip", "bigflip", "biggerflip", "bigspin", "biggerspin",
"bubble flip", "bullflip", "caballerial flip", "camel flip", "casper flip", "daydream flip", "de comply", "disco flip", "feather flip", "fingerflip",
"540 flip", "forward flip", "frontside flip", "frontside heelflip", "front foot impossible", "gazelle flip", "gazelle spin", "ghetto bird", "gingersnap",
"grape flip", "handstand flip", "hardflip", "haslam flip", "heelflip", "hospital flip", "illusion flip", "impossible", "inward heelflip", "jesus flip",
"kickback flip", "kickflip", "kiwi flip", "laser flip", "nerd flip", "nightmare flip", "orange flip", "ollie north", "ollie south", "plasma spin",
"pop shuvit", "pressure flip", "rail flip", "semiflip", "720 flip", "sex change", "shuvit", "pop shuvit", "sigma flip", "360 flip", "360 shuvit",
"360 ollie heelflip", "360 ollie kickflip", "toeflip", "underflip", "varial heelflip", "varial kickflip"]

if db.execute('SELECT * FROM  tricks').empty? == true
populate_trick_list = <<-SQL
  INSERT INTO tricks (trick) SELECT(?)
  WHERE NOT EXISTS (SELECT 1 FROM tricks WHERE trick = ?);
SQL

trick_list.each {|trick| db.execute(populate_trick_list, [trick])}
end
########## Creates and populates  stances table containting regular and goofy stances

create_stances_table = <<-SQL
  CREATE TABLE IF NOT EXISTS stances (
    id INTEGER,
    stance VARCHAR(255),
    PRIMARY KEY (id)
  );
SQL

db.execute(create_stances_table)

if db.execute('SELECT * FROM  stances').empty? == true
insert_stances = <<-SQL
  INSERT INTO stances (stance) SELECT (?)
  WHERE NOT EXISTS (SELECT 1 FROM stances WHERE stance = ?);
SQL

['regular', 'goofy'].each {|stance| db.execute(insert_stances, [stance])}
end
########## Creates and populates letters table  containting number of letters a skater has

create_letters_table = <<-SQL
  CREATE TABLE IF NOT EXISTS letters (
    id INTEGER,
    letter VARCHAR(255),
    PRIMARY KEY ('id')
  );
SQL

db.execute(create_letters_table)

if db.execute('SELECT * FROM  letters').empty? == true
insert_letters = <<-SQL
  INSERT INTO letters (letter) SELECT (?)
  WHERE NOT EXISTS (SELECT 1 FROM letters WHERE letter = ?);
SQL

['S.', 'S.K', 'S.K.A', 'S.K.A.T', 'S.K.A.T.E.'].each {|letter| db.execute(insert_letters, [letter])}
end

########## Creates rounds table  containting rounds of the competition

create_rounds_table = <<-SQL
  CREATE TABLE IF NOT EXISTS rounds (
    id INTEGER,
    round VARCHAR(255),
    PRIMARY KEY ('id')
  );
SQL

db.execute(create_rounds_table)

if db.execute('SELECT * FROM  rounds').empty? == true
insert_rounds = <<-SQL
  INSERT INTO rounds (round) SELECT (?)
  WHERE NOT EXISTS (SELECT 1 FROM rounds WHERE round = ?);
SQL

['round 1', 'round 2', 'semi-finals','finals'].each {|round| db.execute(insert_rounds, [round])}
end
########## Creates skater table

create_skaters_table = <<-SQL
  CREATE TABLE IF NOT EXISTS skaters (
    id INTEGER,
    name VARCHAR(255),
    age INTEGER,
    stance VARCHAR(255),
    PRIMARY KEY ('id')
  );
SQL

db.execute(create_skaters_table)

########## Creates landed_tricks table

create_landed_tricks_table = <<-SQL
  CREATE TABLE IF NOT EXISTS landed_tricks (
    game_id INTEGER,
    trick_id INTEGER,
    FOREIGN KEY (game_id) REFERENCES games_of_skate ('id'),
    FOREIGN KEY (trick_id) REFERENCES tricks ('id')
  );
SQL

db.execute(create_landed_tricks_table)

########## Creates games_of_skate table

create_games_of_skate_table = <<-SQL
  CREATE TABLE IF NOT EXISTS games_of_skate (
    id INTEGER,
    skater_1_id INTEGER,
    skater_2_id INTEGER,
    skater_1_letters_id INTEGER DEFAULT 0,
    skater_2_letters_id INTEGER DEFAULT 0,
    winner_id INTEGER,
    round_id INTEGER,
    game_number INTEGER,
    FOREIGN KEY (skater_1_id) REFERENCES skaters ('id'),
    FOREIGN KEY (skater_2_id) REFERENCES skaters ('id'),
    FOREIGN KEY (skater_1_letters_id) REFERENCES letters ('id'),
    FOREIGN KEY (skater_2_letters_id) REFERENCES letters ('id'),
    FOREIGN KEY (winner_id) REFERENCES skaters ('id'),
    FOREIGN KEY (round_id) REFERENCES rounds ('id'),
    PRIMARY KEY ('id')
  );
SQL

db.execute(create_games_of_skate_table)

########## Retrieves id's of various foreign keys

def retrieve_skater_id(db, name)
  db.execute('SELECT id FROM skaters Where name LIKE ?', [name])
end

def retrieve_trick_id(db, trick)
  db.execute('SELECT id FROM tricks Where trick LIKE ?', [trick])
end

def retrieve_round_id(db, round)
  db.execute('SELECT id FROM rounds Where round LIKE ?', [round])
end

def retrieve_game_id(db, round, game_number)
    round_id = retrieve_round_id(db, round)
    db.execute('SELECT id FROM games_of_skate WHERE round_id = ? AND game_number = ?', [round_id, game_number])
end

########## Creates the competition bracket
if db.execute('SELECT * FROM  games_of_skate').empty? == true

  create_game = <<-SQL
    INSERT INTO games_of_skate (round_id, game_number) VALUES (?, ?)
  SQL

  ['round 1', 'round 2', 'semi-finals','finals'].each do |round|
    round_id = retrieve_round_id(db, round)
    if (round == 'round 1')
      8.times {|game_number| db.execute(create_game, [round_id, game_number + 1])}

    elsif (round == 'round 2')
      4.times {|game_number| db.execute(create_game, [round_id, game_number + 1])}

    elsif (round == 'semi-finals')
      2.times {|game_number| db.execute(create_game, [round_id, game_number + 1])}

    elsif (round == 'finals')
      db.execute(create_game, [round_id, 1])
    end
  end
end

########## Stores skater's in the skaters table

def signup_skaters(db, name, age, stance)
  db.execute('INSERT INTO skaters (name, age, stance) VALUES (?,?,?)', [name, age, stance])
end

########## Gets all contestants information from the user and stores in the skaters table

if db.execute('SELECT * FROM skaters').empty? == true

  puts "enter your 16 contestants' information"

  16.times do |slots|
    puts 'Name:'
    # name = gets.chomp
    name = Faker::Name.name
    puts 'age:'
    # age = gets.chomp.to_i
    age = rand(13..99)
    puts 'stance:'
    # stance = gets.chomp
    stance = ['regular', 'goofy'].shuffle.first

    signup_skaters(db, name, age, stance)
  end
end

########## Randomly assigns contestants to round 1 of the bracket in the games_of_skate table

round_1_empty = db.execute('SELECT skater_2_id FROM games_of_skate WHERE round_id = 1')[rand(1..8)][0] == nil

if round_1_empty == true
  names_array = db.execute('SELECT name FROM skaters')

  random_game_number_array1 = (1..8).to_a.shuffle
  random_game_number_array2 = (1..8).to_a.shuffle

  update_skater_1 = <<-SQL
  UPDATE games_of_skate SET skater_1_id = ? WHERE round_id = 1 AND game_number = ?
  SQL

  update_skater_2 = <<-SQL
  UPDATE games_of_skate SET skater_2_id = ? WHERE round_id = 1 AND game_number = ?
  SQL

  counter = 1

  names_array.each do |name|
    if counter <= 8
      skater_id = retrieve_skater_id(db, name)
      game_number = random_game_number_array1.pop
      db.execute(update_skater_1, [skater_id, game_number])
      counter += 1
    else
      skater_id = retrieve_skater_id(db, name)
      game_number = random_game_number_array2.pop
      db.execute(update_skater_2, [skater_id, game_number])
      counter += 1
    end
  end
end

########## Displays round 1 matchups

display_round_1_bracket = <<-SQL
  SELECT rounds.round, games_of_skate.game_number, contestant1.name, contestant2.name
  FROM games_of_skate
    JOIN skaters AS contestant1
      ON games_of_skate.skater_1_id = contestant1.id
    JOIN skaters AS contestant2
      ON games_of_skate.skater_2_id = contestant2.id
    JOIN rounds
      ON games_of_skate.round_id = rounds.id
SQL

db.execute(display_round_1_bracket).each do |match_info|
  puts "round | game_number | contestant1 | contestant2"
  p match_info
end

########## Allows the user to store the tricks that have been landed and thus can't be done again in game

def input_landed_trick(db)
  puts "Enter the round: "
  round = gets.chomp
  puts "Enter the game number: "
  game_number = gets.chomp
  puts "Enter landed trick: "
  trick = gets.chomp

  game_id = retrieve_game_id(db, round, game_number)
  trick_id = retrieve_trick_id(db, trick)

  insert_trick = <<-SQL
    INSERT INTO landed_tricks (game_id, trick_id) VALUES (?,?)
  SQL
  db.execute(insert_trick, [game_id, trick_id])
end

########## Allows the user to give a skater a leter

def give_skater_letter(db)
  puts "Enter the round: "
  round = gets.chomp
  puts "Enter the game number: "
  game_number = gets.chomp
  puts "Enter skater's name: "
  name = gets.chomp

  game_id = retrieve_game_id(db, round, game_number)
  skater_id = retrieve_skater_id(db, name)

  give_skater_1_letter = <<-SQL
    UPDATE games_of_skate SET skater_1_letters_id = ? WHERE id = ?
  SQL

  give_skater_2_letter = <<-SQL
    UPDATE games_of_skate SET skater_2_letters_id = ? WHERE id = ?
  SQL

  if db.execute('SELECT skater_1_id FROM games_of_skate WHERE id = ?', [game_id]) == skater_id

    letters_id = db.execute(
      'SELECT skater_1_letters_id FROM games_of_skate
      JOIN letters
        ON games_of_skate.skater_1_letters_id = letters.id
        WHERE games_of_skate.id = ?',
    [game_id])
    p letters_id[0][0]
    letter_id = letters_id[0][0] += 1

    db.execute(give_skater_1_letter, [letter_id, game_id])
  else

    letters_id = db.execute(
      'SELECT skater_2_letters_id FROM games_of_skate
        WHERE games_of_skate.id = ?',
    [game_id])
    p letters_id[0][0]
    letter_id = letters_id[0][0] += 1

    db.execute(give_skater_2_letter, [letter_id, game_id])
  end
end

########## Allows the user to input the winner of a match and automatically advances the winner to the next round

def input_winner(db)
  puts "Enter the round: "
  round = gets.chomp
  puts "Enter the game number: "
  game_number = gets.chomp
  puts "Enter the winner: "
  winner = gets.chomp

  game_id = retrieve_game_id(db, round, game_number)
  winner_id = retrieve_skater_id(db, winner)

  db.execute('UPDATE games_of_skate SET winner_id = ? WHERE id = ?', [winner_id, game_id])

  if game_number = 1 && round = 'round 1'
    db.execute('UPDATE games_of_skate SET skater_1_id = ? WHERE round_id = 2 AND game_number = 1', [winner_id])
  elsif game_number = 2 && round = 'round 1'
    db.execute('UPDATE games_of_skate SET skater_2_id = ? WHERE round_id = 2 AND game_number = 1', [winner_id])
  elsif game_number = 3 && round = 'round 1'
    db.execute('UPDATE games_of_skate SET skater_1_id = ? WHERE round_id = 2 AND game_number = 2', [winner_id])
  elsif game_number = 4 && round = 'round 1'
    db.execute('UPDATE games_of_skate SET skater_2_id = ? WHERE round_id = 2 AND game_number = 2', [winner_id])
  elsif game_number = 5 && round = 'round 1'
    db.execute('UPDATE games_of_skate SET skater_1_id = ? WHERE round_id = 2 AND game_number = 3', [winner_id])
  elsif game_number = 6 && round = 'round 1'
    db.execute('UPDATE games_of_skate SET skater_2_id = ? WHERE round_id = 2 AND game_number = 3', [winner_id])
  elsif game_number = 7 && round = 'round 1'
    db.execute('UPDATE games_of_skate SET skater_1_id = ? WHERE round_id = 2 AND game_number = 4', [winner_id])
  elsif game_number = 8 && round = 'round 1'
    db.execute('UPDATE games_of_skate SET skater_2_id = ? WHERE round_id = 2 AND game_number = 4', [winner_id])
  elsif game_number = 1 && round = 'round 2'
    db.execute('UPDATE games_of_skate SET skater_1_id = ? WHERE round_id = 3 AND game_number = 1', [winner_id])
  elsif game_number = 2 && round = 'round 2'
    db.execute('UPDATE games_of_skate SET skater_2_id = ? WHERE round_id = 3 AND game_number = 1', [winner_id])
  elsif game_number = 3 && round = 'round 2'
    db.execute('UPDATE games_of_skate SET skater_1_id = ? WHERE round_id = 3 AND game_number = 2', [winner_id])
  elsif game_number = 4 && round = 'round 2'
    db.execute('UPDATE games_of_skate SET skater_2_id = ? WHERE round_id = 3 AND game_number = 2', [winner_id])
  elsif game_number = 1 && round = 'semi-finals'
    db.execute('UPDATE games_of_skate SET skater_1_id = ? WHERE round_id = 4 AND game_number = 1', [winner_id])
  elsif game_number = 2 && round = 'semi-finals'
    db.execute('UPDATE games_of_skate SET skater_2_id = ? WHERE round_id = 4 AND game_number = 1', [winner_id])
  end
end

########## Allows the user to view the tricks that have been landed and thus can't be done again in game

def print_landed_tricks(db)
  puts "Enter the round: "
  round = gets.chomp
  puts "Enter the game number: "
  game_number = gets.chomp

  game_id = retrieve_game_id(db, round, game_number)
  # round_id = retrieve_round_id(db, round)

  lookup_tricks = <<-SQL
    SELECT tricks.trick
    FROM landed_tricks
      JOIN tricks
        ON landed_tricks.trick_id = tricks.id
        WHERE landed_tricks.game_id = ?
  SQL

  tricks = db.execute(lookup_tricks, [game_id])

  tricks.each {|trick| puts trick}
end

########## Allows the user to look up a skaters info

def print_skater_info(db)
  puts "Enter the contestant's name: "
  name = gets.chomp

  skater_id = retrieve_skater_id(db, name)

  puts 'Name | Age| Stance'
  p db.execute('SELECT name, age, stance FROM skaters WHERE id = ?', [skater_id])

end

#########################################----DRIVER CODE----########################################################
again = nil
option = nil

until option == 6
  puts "\n\n"
  puts "OPTIONS"
  puts "Input the number to perform the corresponding action"
  puts "1 - Enter a landed trick"
  puts "2 - Give skater a letter"
  puts "3 - Print landed tricks"
  puts "4 - Look up skater info"
  puts "5 - Enter match winner"
  puts "6 - Quit"

  option = Integer(gets.chomp)

  puts "\n"

  if option == 1
    input_landed_trick(db)
  elsif option == 2
    give_skater_letter(db)
  elsif option == 3
    print_landed_tricks(db)
  elsif option == 4
    print_skater_info(db)
  elsif option == 5
    input_winner(db)
  elsif option == 6
    puts "Competition info saved"
  else
    puts "Invalid Input"
  end
end
