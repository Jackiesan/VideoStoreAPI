class RentalsController < ApplicationController
  def check_in

    rental = Rental.find_by(customer_id: rental_params[:customer_id], movie_id: rental_params[:movie_id], check_in_status: false)
    if rental
      rental.update(check_in_status: true)
      render json: { status: 'Success', rental: rental }, status: :ok
    else
      # rental.errors.add( :rental, "test" )
      render json: { errors: 'Rental does not exist' }, status: :bad_request
    end

  end

  def check_out
  end

  private
  def rental_params
    return params.permit(:customer_id, :movie_id)
  end
end
