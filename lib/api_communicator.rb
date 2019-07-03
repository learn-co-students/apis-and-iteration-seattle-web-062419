require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character_array = response_hash["results"]
  our_character = character_array.find do |character_hash|
    character_hash["name"].downcase == character_name
    end
    film_array = our_character["films"]
    new_array = film_array.map do |film_url|
      response_string  = RestClient.get(film_url)
        response_hash = JSON.parse(response_string)
      end
      return new_array

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  title_array = films.map do |film|
    film["title"]
  end
  puts title_array
end



def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

def show_movie_characters(movie)
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)
  movie_array = response_hash["results"]
  our_movie = movie_array.find do |movie_hash|
    movie_hash["title"].downcase == movie

  end
  character_array = our_movie["characters"]
  character_names = character_array.map do |url|
    response_string = RestClient.get(url)
    response_hash = JSON.parse(response_string)
    response_hash["name"]
  end
  puts character_names
end
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
