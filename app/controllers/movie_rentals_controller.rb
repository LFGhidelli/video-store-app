class MovieRentalsController < ApplicationController
  before_action :set_movie

  def new
    @movie_rental = MovieRental.new()
  end

  def create
    debugger
    @movie = Movie.create!(
      title: @movie_info["title"],
      description: @movie_info["overview"],
      release_year: @movie_info["release_date"],
      genre: @movie_info["genres"]
    )
    @rental = current_user.rentals.find_by(status: :pending) || current_user.rentals.create!(status: 0)
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
