# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  before_action :customer_status, only: [:create]

  layout "customers"
  
  def after_sign_in_path_for(resource)
    customers_path
  end

  def after_sign_out_path_for(resource)
    customers_path
  end
  
  protected
  
  def customer_status
    @customer = Customer.find_by(email: params[:customer][:email])
     return if @customer
     if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
       redirect_to new_customer_registration_path
     else 
       redirect_to customers_path
     end
  end

  
end
