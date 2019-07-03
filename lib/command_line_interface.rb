def welcome
  puts "I am your father!"
end

def get_character_from_user
  puts "please enter a character name"
  gets.downcase.chomp# use gets to capture the user's input. This method should return that input, downcased.
end

def get_movie_from_user
  puts "please enter a movie title"
  gets.downcase.chomp
end
