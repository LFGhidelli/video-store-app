class MakeRentalStatusNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :rentals, :status, false
  end
end
