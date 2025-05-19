class Rental < ApplicationRecord
  belongs_to :user

  has_many :movie_rentals, dependent: :destroy
end
