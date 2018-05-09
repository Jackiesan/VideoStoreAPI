require "test_helper"

describe Movie do

  let(:harry_potter) { movies(:harry) }

  describe "validations" do
    it "is valid when all fields are present" do
      harry_potter.valid?.must_equal true
    end

    it "is not valid when title is missing" do
      harry_potter.title = nil
      harry_potter.valid?.must_equal false
    end

    it "is not valid when overview is missing" do
      harry_potter.overview = nil
      harry_potter.valid?.must_equal false
    end

    it "is not valid when release_date is missing" do
      harry_potter.release_date = nil
      harry_potter.valid?.must_equal false
    end

    it "is not valid when inventory is missing" do
      harry_potter.inventory = nil
      harry_potter.valid?.must_equal false
    end
  end

  describe "relations" do
    it "responds to rentals" do
      harry_potter.must_respond_to :rentals
    end
  end

  describe "custom methods" do
    it "returns an available_inventory successfully" do
      # save initial inventory
      # checkin a rental a couple of times
      # check that the available_inventory = inventory - rentals currently out
    end
  end

end
