class Customers::OrdersController < ApplicationController
layout "customers"

def index
  @orders = Order.where(customer_id:current_customer).order("created_at DESC")
end

def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
  @order.fee = 800
end

def new
  @order = Order.new
end

def create
  @order = current_customer.orders.new(order_params)
  @order.customer_id = current_customer.id
  cart_items = current_customer.cart_items.all

  if @order.save!

    cart_items.each do |cart|

      order_detail = OrderDetail.new
      order_detail.sweet_id = cart.sweet_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.quantity

      order_detail.save
    end
    redirect_to complete_customers_orders_path
    cart_items.destroy_all

  else
    @order = Order.new(order_params)
    render :new
  end
end


def confirm
  @order = Order.new(order_params)

  if params[:order][:select_addresses] == "1" #自宅
    @order.post_code = current_customer.post_code
    @order.addresses = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name

  elsif params[:order][:select_addresses] == "2" #既存のお届け先

    @order.post_code = Address.find(params[:order][:registered]).post_code
    @order.name = Address.find(params[:order][:registered]).name
    @order.addresses = Address.find(params[:order][:registered]).address

  elsif params[:order][:select_addresses] == "3"  #新しいお届け先
    address_new = current_customer.addresses.new(address_params)
    if address_new.save
    else
      render new
    end

  end
  @cart_items = CartItem.all
  @total = @cart_items.inject(0) { |sum, sweet| sum + sweet.subtotalprice }
end

  def order_status_update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)



  end

  def item_status_update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    redirect_to admin_order_path(order_detail.order_id)
  end

private

def order_params
  params.require(:order).permit(:customer_id, :post_code, :status, :fee, :payment_method, :name, :addresses, :total_payment)
end

  def order_detail_params
    params.require(:order_detail).permit(:_status)
  end

def address_params
  params.require(:order).permit(:name, :address, :post_code)
end

end
