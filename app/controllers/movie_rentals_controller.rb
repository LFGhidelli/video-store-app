class MovieRentalsController < ApplicationController
  before_action :set_movie

  def new
    @movie_rental = MovieRental.new()
  end

  def create
    @movie = Movie.create!(
      title: @movie_info["title"],
      description: @movie_info["overview"],
      release_year: @movie_info["release_date"],
      genre: @movie_info["genres"],
      poster_path: "https://image.tmdb.org/t/p/w200#{@movie_info["poster_path"]}"
    )
    @rental = current_user.rentals.create!(status: "ongoing")
    @movie_rental = @rental.movie_rentals.create!(
      movie_id: @movie.id,
      rental_date: params[:rental_date],
      return_date: params[:return_date]
    )

    redirect_to root_path
  end

  private
    def set_movie
      @movie_info = TmdbClient.movie_details(params[:movie_id].to_i)
    end
end
