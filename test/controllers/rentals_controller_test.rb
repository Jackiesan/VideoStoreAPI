require "test_helper"

describe RentalsController do
  let(:customer) { customers(:tommy)}
  let(:movie) { movies(:harry)}
  describe "check_out" do
    let(:rental_data) {
      {
        movie_id: movie.id,
        customer_id: customer.id
      }
    }

    it "creates a new rental" do
      proc {
        post check_out_path, params: rental_data
      }.must_change 'Rental.count', 1

      must_respond_with :success
    end

    it "returns bad request for bad customer params data" do
      rental_data.delete(:customer_id)
      proc {
        post check_out_path, params: rental_data
      }.must_change 'Rental.count', 0

      must_respond_with :bad_request
      body = JSON.parse(response.body)
      body.must_be_kind_of Hash
      body.must_include "errors"
      body["errors"].must_include "customer"
    end

    it "returns bad request for bad movie params data" do
      rental_data.delete(:movie_id)
      proc {
        post check_out_path, params: rental_data
      }.must_change 'Rental.count', 0

      must_respond_with :bad_request
      body = JSON.parse(response.body)
      body.must_be_kind_of Hash
      body.must_include "errors"
      body["errors"].must_include "movie"
    end
  end

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
