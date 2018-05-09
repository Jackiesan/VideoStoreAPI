class Customer < ApplicationRecord
  has_many :rentals, dependent: :destroy
  validates :name, presence: true
  validates :registered_at, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :phone, presence: true

  def get_count(customer_id)
    customer = Customer.find(customer_id)

    items_checked_out = customer.rentals.select { |rental| rental.check_in_status == false }

    if !items_checked_out.empty?
      return items_checked_out.count
    else
      return 0
    end
  end
end
