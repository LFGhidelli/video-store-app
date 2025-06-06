class Rental < ApplicationRecord
  belongs_to :user

  has_many :movie_rentals, dependent: :destroy

  enum :status, %w[pending ongoing returned]
end
