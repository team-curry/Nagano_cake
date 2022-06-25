class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first__name_kana, :post_code, :address, :phone_number, :is_deleted])
  end

  helper_method :current_cart_item

  def current_cart_item
    if current_customer
      current_cart_item = current_customer.cart_items || current_customer.create_cart_item!
    else
      redirect_to new_customer_registration_path
    end
    current_cart_item
  end

end
