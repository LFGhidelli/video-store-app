class Rental < ApplicationRecord
  belongs_to :user

  has_many :movie_rentals

  enum status: { pending: 0, completed: 1 }
  add_index :rentals, [ :user_id, :status ], unique: true, where: "status = 0"
end
