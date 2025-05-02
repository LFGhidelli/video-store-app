class AddCustomerToRentals < ActiveRecord::Migration[8.0]
  def change
    add_reference :rentals, :customer, null: false, foreign_key: true
  end
end
