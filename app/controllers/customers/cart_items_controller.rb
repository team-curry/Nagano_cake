class Customers::CartItemsController < ApplicationController
layout "customers"
 before_action :authenticate_customer!

  def show
   @cart_item = current_customer.cart_items
   @total = @cart_item.inject(0) { |sum, sweet| sum + sweet.subtotal }
  end

  def create


   cart_item = current_customer.cart_items.find_by(sweet_id: params[:cart_item][:sweet_id])
    if cart_item.present?
      cart_item.quantity += params[:cart_item][:quantity].to_i
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
    end


    if  cart_item.save
      flash[:notice] = '商品が追加さました。'
      redirect_to customers_cart_items_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to customers_sweets_path(params[:sweet_id])
    end
  end

  def update
    if @cart_item.update(quantity: params[:quantity].to_i)
      flash[:notice] = 'カート内の商品が更新されました'
    else
      flash[:alert] = 'カート内の商品の更新に失敗しました'
    end
    redirect_to cart_item_path
  end

  def destroy
    cart_item = current_customer.cart_items.find_by(sweet_id: params[:sweet_id])
    # binding.pry
    if cart_item.destroy
      flash[:notice] = 'カート内のギフトが削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to customers_cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to customers_cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:sweet_id, :customer_id, :quantity)
  end

end
