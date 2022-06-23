class Customers::OrdersController < ApplicationController
layout "customers"


def new
  @order = Order.new
end

def create
  cart_items = CartItem.all

  @order = current_customer.orders.new(order_params)

  if @order.save

    cart_items.each do |cart|

      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.order_quantity = cart.quantity

      order_item.order_price = cart.item.price

      order_item.save
    end
    redirect_to customers_orders_complete_path
    cart_items.destroy_all

  else
    @order = Order.new(order_params)
    render :new
  end
end


def confirm
  @order = Order.new(order_params)

  if params[:order][:address_number] == "1"

    @order.address = current_customer.customer_address
  elsif params[:order][:address_number] == "2"

    if Address.exists?(name: params[:order][:registered])

      @order.name = Address.find(params[:order][:registered]).name
      @order.address = Address.find(params[:order][:registered]).address
    else
      render :new

    end
  elsif params[:order][:address_number] == "3"

    address_new = current_customer.addresses.new(address_params)
    if address_new.save
    else
      render :new

    end
  # else
  #   redirect_to customers_cart_items_path
  end
  @cart_items = CartItem.all
  @total = @cart_items.inject(0) { |sum, sweet| sum + sweet.subtotal }

end

private

def order_params
  params.require(:order).permit(:name, :addresses, :total_payment)
end

def address_params
  params.require(:order).permit(:name, :address)
end

end
