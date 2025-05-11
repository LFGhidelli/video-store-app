class AddRentalDateAndReturnDateToMovieRentals < ActiveRecord::Migration[8.0]
  def change
    add_column :movie_rentals, :rental_date, :datetime
    add_column :movie_rentals, :return_date, :datetime
  end
end
