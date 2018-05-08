require "test_helper"

describe RentalsController do

  describe "check_in" do
    let(:rental) { rentals(:one) }

    # it "checks in a valid rental" do
    #   # rental
    #   proc {
    #     post check_in_path, params: {
    #       customer_id: rental.customer,
    #       movie_id: rental.movie
    #     }
    #   }.must_equal 'rental.check_in_status', true
    #   # rental.check_in_status.must_equal true
    #   must_respond_with :success
    # end

    it "does not check in a rental that has already been checked in" do

    end

    it "returns bad_request if customer does not exist" do

    end

    it "returns bad_request if movie does not exist" do

    end
  end

end
