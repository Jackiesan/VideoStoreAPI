require "test_helper"

describe CustomersController do
  describe "index" do
    it "is a real working route" do
      get customers_url
      must_respond_with :success
    end

    it "returns json" do
      get customers_url
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an Array" do
      get customers_url
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    it "returns all customers" do
      get customers_url
      body = JSON.parse(response.body)
      body.length.must_equal Customer.count
    end

    it "returns customers with exactly the required fields" do
      keys = %w(id movies_checked_out_count name phone postal_code registered_at)

      get customers_url
      body = JSON.parse(response.body)
      body.each do |customer|
        customer.keys.sort.must_equal keys
      end
    end

    it "returns empty array if there are no customers" do
      all_customers = Customer.all
      all_customers.each do |customer|
        customer.destroy
      end
      get customers_url
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
      body.must_equal []
    end

    it "returns movies checked out count as an integer" do
      get customers_url
      body = JSON.parse(response.body)
      body.each do |customer|
        customer["movies_checked_out_count"].must_be_kind_of Integer
      end
    end

  end
end
