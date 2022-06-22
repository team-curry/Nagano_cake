class Customers::CartItemsController < ApplicationController
layout "customers"

  
  def index
   @cart_items = CartItem.all
   @total = @cart_items.inject(0) { |sum, sweet| sum + sweet.sum_price }
  end
  
  def create
     
    @cart_item ||= current_customer.cart_items.build(sweet_id: params[:sweet_id])
    @cart_item.quantity += params[:quantity].to_i
    if  @cart_item.save
      flash[:notice] = '商品が追加されました。'
      redirect_to cart_item_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to sweet_url(params[:sweet_id])
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
    if @cart_item.destroy
      flash[:notice] = 'カート内のギフトが削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to cart_item_path
  end
  
  def all_detroy
    
  end
  
  
  private
  
  def cart_item_params
    params.require(:cart).permit(:item_id, :count)
  end

  def setup_cart_item!
    @cart_item = current_cart_item.cart_items.find_by(sweet_id: params[:sweet_id])
  end

end
