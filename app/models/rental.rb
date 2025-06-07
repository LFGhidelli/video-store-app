class Rental < ApplicationRecord
  belongs_to :user

  has_many :movie_rentals, dependent: :destroy

  enum :status, %w[pending ongoing returned].index_by(&:itself)
end
