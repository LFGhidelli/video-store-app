class CreateMovieRentals < ActiveRecord::Migration[8.0]
  def change
    create_table :movie_rentals do |t|
      t.timestamps
    end
  end
end
