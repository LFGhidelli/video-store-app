class ChangeStatusFromIntegerToString < ActiveRecord::Migration[8.0]
  def change
    change_column :rentals, :status, :string, default: "pending", null: false
  end
end
