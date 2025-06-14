require "uri"
require "net/http"

class TmdbClient
  def self.popular_movies
    Rails.cache.fetch("popular_movies", expires_in: 1.hour) do
      begin
        url = URI("https://api.themoviedb.org/3/movie/popular")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["accept"] = "application/json"
        request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWJmYjRkOTgyMzQzY2NmOTliNjcwNmE5OGE3MjMxNyIsIm5iZiI6MTc0NTA3NDAxNi4xMjcsInN1YiI6IjY4MDNiNzYwYjEzNDEwY2RjNzk5NGE0YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PC0SXjznAN2xLK4v64RC_5xnmA_o8_u9drDKo0GyCsU"

        response = http.request(request)
        JSON.parse(response.body.force_encoding("UTF-8"))
      rescue SocketError
        sleep(2)
        retry
      end
    end
  end

  def self.top_rated_movies
    Rails.cache.fetch("top_rated_movies", expires_in: 1.hour) do
      Rails.logger.info ">>>>>>>>>>>>>>>>>>> buscando na api"
      url = URI("https://api.themoviedb.org/3/movie/top_rated")

      begin
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["accept"] = "application/json"
        request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWJmYjRkOTgyMzQzY2NmOTliNjcwNmE5OGE3MjMxNyIsIm5iZiI6MTc0NTA3NDAxNi4xMjcsInN1YiI6IjY4MDNiNzYwYjEzNDEwY2RjNzk5NGE0YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PC0SXjznAN2xLK4v64RC_5xnmA_o8_u9drDKo0GyCsU"

        response = http.request(request)
        JSON.parse(response.body.force_encoding("UTF-8"))
      rescue SocketError
        sleep(2)
        retry
      end
    end
  end

  def self.movie_details(movie_id)
    Rails.cache.fetch("movie_details", expires_in: 1.hour) do
      max_retries = 3
      attempts = 0

      begin
        url = URI("https://api.themoviedb.org/3/movie/#{movie_id}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["accept"] = "application/json"
        request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWJmYjRkOTgyMzQzY2NmOTliNjcwNmE5OGE3MjMxNyIsIm5iZiI6MTc0NTA3NDAxNi4xMjcsInN1YiI6IjY4MDNiNzYwYjEzNDEwY2RjNzk5NGE0YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PC0SXjznAN2xLK4v64RC_5xnmA_o8_u9drDKo0GyCsU"

        response = http.request(request)
        JSON.parse(response.body.force_encoding("UTF-8"))
      rescue SocketError
        attempts += 1
        if attempts < max_retries
          sleep(2)
          retry
        else
          Rails.logger.error "Deu ruim depois de #{e.max_retries} tentativas"
        end
      end
    end
  end

  def self.movie_video(movie_id)
    Rails.cache.fetch("movie_video", expires_in: 1.hour) do
      begin
        url = URI("https://api.themoviedb.org/3/movie/#{movie_id}/videos")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["accept"] = "application/json"
        request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWJmYjRkOTgyMzQzY2NmOTliNjcwNmE5OGE3MjMxNyIsIm5iZiI6MTc0NTA3NDAxNi4xMjcsInN1YiI6IjY4MDNiNzYwYjEzNDEwY2RjNzk5NGE0YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PC0SXjznAN2xLK4v64RC_5xnmA_o8_u9drDKo0GyCsU"

        response = http.request(request)
        JSON.parse(response.body.force_encoding("UTF-8"))
      rescue SocketError
        sleep(2)
        retry
      end
    end
  end
end
