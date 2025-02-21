require 'open-uri'
require 'json'

url = 'https://tmdb.lewagon.com/movie/top_rated'
url_serialized = URI.open(url).read
movies_parsed = JSON.parse(url_serialized)
movies = movies_parsed['results']

movies = Movie.all
movies.destroy_all
puts 'Destroyed all Movies!'


15.times do
  movies.each do |movie| {
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  }
  end
end


puts 'Created all 15 restaurants succesfully!'
