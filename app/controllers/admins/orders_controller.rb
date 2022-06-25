class Admins::OrdersController < ApplicationController
  layout "admins"

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = @order.total_payment
    @total_price = @total + 800
  end

  def status_update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admins_order_path(order)
  end

  def making_status_update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    redirect_to admins_order_path(order_detail.order_id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end