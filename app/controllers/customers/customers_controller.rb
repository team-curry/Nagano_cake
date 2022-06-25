class Customers::CustomersController < ApplicationController
  layout "customers"

  def show
   @customer = Customer.find(params[:id])
  end
end
