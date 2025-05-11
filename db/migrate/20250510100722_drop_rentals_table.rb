class DropRentalsTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :rentals
  end
end
