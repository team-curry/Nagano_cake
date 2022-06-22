class Customers::OrdersController < ApplicationController
layout "customers"

    def new
      @order = Order.new
    end
  
    def create
      redirect_to action: :complete
    end
    
    def confirm
      @cart_items = current_customer.cart_items.all
      @total = @cart_items.inject(0) { |sum, sweet| sum + sweet.sum_price }
      
      @order = Order.new(order_params)

      if params[:order][:address_number] == "1"
        @order.name = current_customer.name
        @order.address = current_customer.customer_address
      elsif params[:order][:address_number] == "2"
         if Address.exists?(name: params[:order][:address_id])
          @order.name = Address.find(params[:order][:address_id]).name
          @order.address = Address.find(params[:order][:address_id]).address
         else
          render :new
         end
      elsif params[:order][:address_number] == "3"
          address_new = current_customer.addresses.new(address_params)
        if address_new.save 
        else
          render :new
        end
      else
        redirect_to cart_items_path 
      end
    end
    
    def complete
      
    end
    
    
    def index
      
    end
    
    private
      def order_params
        params.require(:order).permit(:payment_method, :post_code, :address, :name, :total_payment)
      end
      
    def address_params
      params.require(:order).permit(:name, :address, :post_code)
    end
end
