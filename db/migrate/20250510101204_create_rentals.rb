class CreateRentals < ActiveRecord::Migration[8.0]
  def change
    create_table :rentals do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
