class MovieRental < ApplicationRecord
  belongs_to :rental
  belongs_to :movie
end
