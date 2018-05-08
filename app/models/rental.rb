class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer
  validates :checked_out, presence: true
  validates :due_date, presence: true
  validates :check_in_status,  inclusion: { in: [ true, false ] }

  def self.get_due_date
    return self.check_out + 7
  end
end
