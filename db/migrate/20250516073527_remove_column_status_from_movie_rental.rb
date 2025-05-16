class RemoveColumnStatusFromMovieRental < ActiveRecord::Migration[8.0]
  def change
    remove_column :movie_rentals, :status
  end
end
