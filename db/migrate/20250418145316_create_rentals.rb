class CreateRentals < ActiveRecord::Migration[8.0]
  def change
    create_table :rentals do |t|
      t.date :rental_date
      t.date :return_date
      t.integer :status

      t.timestamps
    end
  end
end
