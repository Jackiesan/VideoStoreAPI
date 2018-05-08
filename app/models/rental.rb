class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer
  validates :checked_out, presence: true
  validates :due_date, presence: true
  validates :movie, presence: true
  validates :customer, presence: true
end
