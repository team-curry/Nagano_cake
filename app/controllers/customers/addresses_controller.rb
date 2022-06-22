class Customers::AddressesController < ApplicationController
  layout "customers"
  def index
    @addresses = Address.all
    @address = Address.new
  end
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to customers_addresses_path(@address.id)
  end
  def edit
    @address = Address.find(params[:id])
    if @customer == current_customer
      render :edit
    else
      redirect_to customer_path(current_customer.id)
    end
  end
  def update
    
  end
  def destroy
    
  end
end
