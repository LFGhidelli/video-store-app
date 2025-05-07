class Rental < ApplicationRecord
  has_many :movie_rentals

  # enum status: { active: 0, returned: 1, overdue: 2 }
end
