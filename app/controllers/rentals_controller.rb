require 'date'

class RentalsController < ApplicationController

  def check_in
  end

  def check_out
    rental = Rental.new(rental_params)
    rental.checked_out = DateTime.now.to_date
    rental.due_date = rental.get_due_date
    rental.check_in_status = false
    if rental.save
      render json: { id: rental.id }, status: :ok
    else
      render json: { errors: rental.errors }, status: :bad_request
    end
  end

  private

  def rental_params
    return params.permit(:movie_id, :customer_id)
  end
end
