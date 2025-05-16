class MovieRentalsController < ApplicationController
  def new
    @movie_rental = MovieRental.new()
  end

  def create
    debugger
    @rental = current_user.rentals.find_by(status: :pending) || current_user.rentals.create!(status: 0)
    @movie_rental = @rental.movie_rentals.create!(
      movie_id: params[:movie_id].to_i,
      rental_date: params[:rental_date],
      return_date: params[:return_date]
    )

    redirect_to root_path
  end
end
