class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customers = @customers.sort_by &params[:sort].to_sym if params[:sort]
    @customers = @customers.first(params[:n].to_i) if params[:n]
    @customers_data = []
    @customers.each do |customer|
      movies_checked_out_count = {"movies_checked_out_count" => customer.get_count }
      customer = JSON::parse(customer.to_json(only: [:id, :name, :registered_at, :postal_code, :phone])).merge(movies_checked_out_count)
      @customers_data << customer
    end

    render json: @customers_data.as_json
  end
end
