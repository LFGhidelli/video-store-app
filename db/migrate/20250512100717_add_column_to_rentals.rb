class AddColumnToRentals < ActiveRecord::Migration[8.0]
  def change
    add_column :rentals, :status, :integer
  end
end
