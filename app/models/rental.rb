class Rental < ApplicationRecord
  has_many :movie_rentals

  enum status: { ctive: 0, returned: 1, overdue: 2 }
end
