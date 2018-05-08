require "test_helper"

describe Rental do
  let(:rental) { Rental.new }
  let(:my_rental) { rentals(:one) }

  # it "must be valid" do
  #   value(rental).must_be :valid?
  # end

  describe "relations" do
    it "responds to movies" do
      my_rental.must_respond_to :movie
    end

    it "responds to customers" do
      my_rental.must_respond_to :customer
    end
  end
end
