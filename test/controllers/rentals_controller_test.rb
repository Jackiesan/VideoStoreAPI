require "test_helper"

describe RentalsController do

  describe "check_in" do
    let(:rental) { rentals(:one) }

    it "checks in a valid rental" do

      post check_in_path, params: {
        customer_id: rental.customer.id,
        movie_id: rental.movie.id
      }
      # rental.check_in_status.must_equal true
      body = JSON.parse(response.body)
      body["rental"]["check_in_status"].must_equal true
      must_respond_with :success
    end

    it "returns bad_request if customer does not exist" do
      rental.customer.destroy
      post check_in_path, params: {
        customer_id: rental.customer.id,
        movie_id: rental.movie.id
      }
      must_respond_with :bad_request
    end

    it "returns bad_request if movie does not exist" do
      rental.movie.destroy
      post check_in_path, params: {
        customer_id: rental.customer.id,
        movie_id: rental.movie.id
      }
      must_respond_with :bad_request
    end
  end

end
