class MovieRentalsController < ApplicationController
  def new
    @movie_rental = MovieRental.new()
  end

  def create
    @rental = current_user.rentals.find_or_create_by(status: :pending)
    @movie_rental = MovieRental.create(
      movie_id: params[:movie_id],
      rental_date: params[:rental_date],
      return_date: params[:return_date]
    )
  end
end
