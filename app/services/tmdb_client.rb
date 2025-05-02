require "uri"
require "net/http"

class  TmdbClient
  def self.movie_list
    url = URI("https://api.themoviedb.org/3/movie/changes?page=1")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = "application/json"
    request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWJmYjRkOTgyMzQzY2NmOTliNjcwNmE5OGE3MjMxNyIsIm5iZiI6MTc0NTA3NDAxNi4xMjcsInN1YiI6IjY4MDNiNzYwYjEzNDEwY2RjNzk5NGE0YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PC0SXjznAN2xLK4v64RC_5xnmA_o8_u9drDKo0GyCsU"

    response = http.request(request)
    puts response.read_body
  end
end
