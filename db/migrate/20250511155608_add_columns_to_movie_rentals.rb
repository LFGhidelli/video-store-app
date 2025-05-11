class AddColumnsToMovieRentals < ActiveRecord::Migration[8.0]
  def change
    add_reference :movie_rentals, :rental, null: false, foreign_key: true
    add_reference :movie_rentals, :movie, null: false, foreign_key: true
    add_column :movie_rentals, :returned_at, :datetime
    add_column :movie_rentals, :status, :integer
  end
end
