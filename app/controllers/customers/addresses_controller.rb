class Customers::AddressesController < ApplicationController
  layout "customers"
  def index
    @addresses = Address.all
    @address = Address.new
  end
  def edit
    @address = Address.find(params[:id])
    if @customer == current_customer
      render :edit
    else
      redirect_to customer_path(current_customer.id)
    end
  end
end
