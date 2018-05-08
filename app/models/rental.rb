class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer
  validates :checked_out, presence: true
  validates :due_date, presence: true

  validates :check_in_status,  inclusion: { in: [ true, false ] }


  # validate :check_in
  #
  # def check_in
  #   if self.check_in_status == true
  #     errors.add( :rental, "This movie has already been checked in" )
  #   end
  # end

end
