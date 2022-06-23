class Admins::HomesController < ApplicationController
  layout "admins"

  def top
   @orders = Order.page(params[:page]).per(10)
  end

  def about

  end
end

  private
  

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_status)
  end
