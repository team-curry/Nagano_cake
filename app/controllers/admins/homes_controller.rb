class Admins::HomesController < ApplicationController
  layout "admins"

  def top
   @order = OrderDetail.page(params[:page])
   @tatal = OrderDetail.all.sum(:quantity)
  end

  def about

  end
end

  private
    def order_detail_params
    	params.require(:order_detail).permit(:quantity, :created_at, ordered_attributes:[:id, :status, :customer_id])
    end
