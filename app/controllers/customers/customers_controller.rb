class Customers::CustomersController < ApplicationController
  layout "customers"

  def show
   @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_customer_path(@customer.id)
    else
      render :edit
    end
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

end
