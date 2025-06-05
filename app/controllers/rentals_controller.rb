class RentalsController < ApplicationController
  def new
    @rental = Rental.new()
  end

  def create
    @rental = Rental.create(
      rental_date:  params[:rental_date],
      return_date:  params[:return_date]

    )
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update!(status: "pending")
  end
end
