class MoviesController < ApplicationController
  def index
    @movies = TmdbClient.top_rated_movies
  end

  def show
    @movie = TmdbClient.movie_details(params[:id])
    @video = TmdbClient.movie_video(params[:id])["results"]
  end
end
