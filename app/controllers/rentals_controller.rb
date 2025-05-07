class RentalsController < ApplicationController

  def new
    @rental = Rental.new()
  end

  def create
    @rental = Rental.create(
      rental_date:,
      return_date: 

    )
  end
end
