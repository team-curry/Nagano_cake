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
   @customer.update(customer_params)
   redirect_to customers_customer_path(current_customer.id)
  end
  
  def unsubscribe
    @customer = Customer.find(params[:id]) 
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to customers_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first__name_kana, :post_code, :address, :phone_number, :is_deleted, :email)
  end
  
   
     
end
