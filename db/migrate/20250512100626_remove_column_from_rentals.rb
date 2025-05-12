class RemoveColumnFromRentals < ActiveRecord::Migration[8.0]
  def change
    remove_column :rentals, :status
  end
end
