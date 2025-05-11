class MovieRentalsController < ApplicationController
  def new
    @movie_rental = MovieRental.new()
  end

  def create
    debugger
    @movie_rental = MovieRental.create(
      movie_id: params[:movie_id],
      rental_date: params[:rental_date],
      return_date: params[:return_date]
    )
  end
end
