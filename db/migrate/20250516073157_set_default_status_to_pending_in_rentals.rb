class SetDefaultStatusToPendingInRentals < ActiveRecord::Migration[8.0]
  def change
    change_column_default :rentals, :status, from: nil, to: 0
  end
end
